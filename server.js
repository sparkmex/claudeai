const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');
const path = require('path');
const PDFDocument = require('pdfkit');
const multer = require('multer');
const fs = require('fs');
const { spawn } = require('child_process');

const app = express();
const PORT = 3000;

// Crear carpeta de uploads si no existe
const uploadDir = path.join(__dirname, 'public', 'uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Configurar multer para guardar archivos
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, uploadDir);
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, uniqueSuffix + path.extname(file.originalname));
  }
});

const upload = multer({
  storage: storage,
  limits: { fileSize: 10 * 1024 * 1024 }, // 10MB máximo
  fileFilter: (req, file, cb) => {
    const allowedTypes = /jpeg|jpg|png|gif|webp/;
    const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = allowedTypes.test(file.mimetype);
    
    if (mimetype && extname) {
      return cb(null, true);
    } else {
      cb(new Error('Solo se permiten imágenes (jpeg, jpg, png, gif, webp)'));
    }
  }
});

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// Inicializar base de datos
const db = new sqlite3.Database('./challenges.db', (err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
  } else {
    console.log('Conectado a SQLite');
    initDatabase();
  }
});

// Crear tabla si no existe
function initDatabase() {
  const createTableSQL = `
    CREATE TABLE IF NOT EXISTS challenges (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre_challenge TEXT NOT NULL,
      descripcion_challenge TEXT,
      lenguaje TEXT,
      complejidad TEXT,
      nivel TEXT,
      solucion_challenge TEXT,
      code_schema TEXT,
      tags TEXT,
      imagen_url TEXT,
      video_demostracion TEXT DEFAULT 'No disponible',
      path TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `;
  
  db.run(createTableSQL, (err) => {
    if (err) {
      console.error('Error al crear tabla:', err);
    } else {
      console.log('Tabla challenges lista');
      // Agregar columna imagen_url si no existe
      db.run(`ALTER TABLE challenges ADD COLUMN imagen_url TEXT`, (err) => {
        if (err) {
          // Columna ya existe, ignorar error
          if (!err.message.includes('duplicate column')) {
            console.log('Columna imagen_url ya existe');
          }
        } else {
          console.log('Columna imagen_url agregada exitosamente');
        }
      });
    }
  });
}

// ===== RUTAS CRUD =====

// CREATE - Crear un nuevo challenge
app.post('/api/challenges', upload.single('imagen'), (req, res) => {
  const {
    nombre_challenge,
    descripcion_challenge,
    lenguaje,
    complejidad,
    nivel,
    solucion_challenge,
    code_schema,
    tags,
    video_demostracion,
    path
  } = req.body;

  const imagenUrl = req.file ? `/uploads/${req.file.filename}` : null;
  const video = video_demostracion || 'No disponible';

  const sql = `
    INSERT INTO challenges (
      nombre_challenge, descripcion_challenge, lenguaje, complejidad,
      nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, path
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.run(sql, [
    nombre_challenge,
    descripcion_challenge,
    lenguaje,
    complejidad,
    nivel,
    solucion_challenge,
    code_schema,
    tags,
    imagenUrl,
    video,
    path || null
  ], function(err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.status(201).json({
      id: this.lastID,
      message: 'Challenge creado exitosamente'
    });
  });
});

// READ - Obtener todos los challenges
app.get('/api/challenges', (req, res) => {
  const sql = 'SELECT * FROM challenges ORDER BY created_at DESC';
  
  db.all(sql, [], (err, rows) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(rows);
  });
});

// READ - Obtener un challenge por ID
app.get('/api/challenges/:id', (req, res) => {
  const sql = 'SELECT * FROM challenges WHERE id = ?';
  
  db.get(sql, [req.params.id], (err, row) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    if (!row) {
      return res.status(404).json({ error: 'Challenge no encontrado' });
    }
    res.json(row);
  });
});

// UPDATE - Actualizar un challenge
app.put('/api/challenges/:id', upload.single('imagen'), (req, res) => {
  const {
    nombre_challenge,
    descripcion_challenge,
    lenguaje,
    complejidad,
    nivel,
    solucion_challenge,
    code_schema,
    tags,
    video_demostracion,
    path
  } = req.body;

  let imagenUrl = null;

  if (req.file) {
    // Si se subió una nueva imagen, usar esa
    imagenUrl = `/uploads/${req.file.filename}`;
  } else if (req.body.imagen_url) {
    // Si no se subió imagen pero viene en el body, mantener la anterior
    imagenUrl = req.body.imagen_url;
  }

  const video = video_demostracion || 'No disponible';

  const sql = `
    UPDATE challenges 
    SET nombre_challenge = ?, descripcion_challenge = ?, lenguaje = ?,
        complejidad = ?, nivel = ?, solucion_challenge = ?,
        code_schema = ?, tags = ?, imagen_url = ?, video_demostracion = ?, path = ?, updated_at = CURRENT_TIMESTAMP
    WHERE id = ?
  `;

  db.run(sql, [
    nombre_challenge,
    descripcion_challenge,
    lenguaje,
    complejidad,
    nivel,
    solucion_challenge,
    code_schema,
    tags,
    imagenUrl,
    video,
    path || null,
    req.params.id
  ], function(err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    if (this.changes === 0) {
      return res.status(404).json({ error: 'Challenge no encontrado' });
    }
    res.json({ message: 'Challenge actualizado exitosamente' });
  });
});

// DELETE - Eliminar un challenge
app.delete('/api/challenges/:id', (req, res) => {
  const sql = 'DELETE FROM challenges WHERE id = ?';
  
  db.run(sql, [req.params.id], function(err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    if (this.changes === 0) {
      return res.status(404).json({ error: 'Challenge no encontrado' });
    }
    res.json({ message: 'Challenge eliminado exitosamente' });
  });
});

// EXPORT - Exportar un challenge a PDF
app.get('/api/challenges/:id/pdf', (req, res) => {
  const sql = 'SELECT * FROM challenges WHERE id = ?';
  
  db.get(sql, [req.params.id], (err, challenge) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    if (!challenge) {
      return res.status(404).json({ error: 'Challenge no encontrado' });
    }

    // Función para limpiar texto y preservar saltos de línea
    const cleanText = (text) => {
      if (!text) return '';
      return text
        .replace(/\r\n/g, '\n') // Normalizar saltos de línea
        .replace(/\r/g, '\n')
        .trim();
    };

    // Crear documento PDF
    const doc = new PDFDocument({
      margins: {
        top: 40,
        bottom: 40,
        left: 40,
        right: 40
      }
    });

    // Configurar respuesta
    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', `attachment; filename="${challenge.nombre_challenge.replace(/[^a-z0-9]/gi, '_')}.pdf"`);

    doc.pipe(res);

    // Título
    doc.fontSize(24).font('Helvetica-Bold').fillColor('#667eea');
    doc.text(challenge.nombre_challenge, { align: 'center' });
    doc.moveDown(0.5);

    // Línea divisoria
    doc.moveTo(40, doc.y).lineTo(555, doc.y).stroke('#667eea');
    doc.moveDown(1);

    // Metadata
    doc.fontSize(11).font('Helvetica').fillColor('#333');
    doc.text(`Lenguaje: ${challenge.lenguaje}`, { continued: true });
    doc.text(`  |  Complejidad: ${challenge.complejidad}`, { continued: true });
    if (challenge.nivel) {
      doc.text(`  |  Nivel: ${challenge.nivel}`);
    } else {
      doc.text('');
    }
    doc.moveDown(1);

    // Descripción
    doc.fontSize(14).font('Helvetica-Bold').fillColor('#667eea');
    doc.text('Descripción');
    doc.fontSize(11).font('Helvetica').fillColor('#333');
    doc.text(cleanText(challenge.descripcion_challenge) || 'Sin descripción', {
      align: 'left',
      width: 475
    });
    doc.moveDown(1);

    // Solución
    if (challenge.solucion_challenge) {
      doc.fontSize(14).font('Helvetica-Bold').fillColor('#667eea');
      doc.text('Solución');
      doc.fontSize(9).font('Courier').fillColor('#333');
      // Dividir el texto en líneas y escribir cada una
      const cleanedSolution = cleanText(challenge.solucion_challenge);
      const solutionLines = cleanedSolution.split('\n');
      solutionLines.forEach(line => {
        doc.text(line || ' ', { width: 475, continued: false });
      });
      doc.moveDown(1);
    }

    // Code Schema
    if (challenge.code_schema) {
      doc.fontSize(14).font('Helvetica-Bold').fillColor('#667eea');
      doc.text('Code Schema');
      doc.fontSize(9).font('Courier').fillColor('#333');
      // Dividir el texto en líneas y escribir cada una
      const cleanedSchema = cleanText(challenge.code_schema);
      const schemaLines = cleanedSchema.split('\n');
      schemaLines.forEach(line => {
        doc.text(line || ' ', { width: 475, continued: false });
      });
      doc.moveDown(1);
    }

    // Tags
    if (challenge.tags) {
      doc.fontSize(14).font('Helvetica-Bold').fillColor('#667eea');
      doc.text('Tags');
      doc.fontSize(11).font('Helvetica').fillColor('#333');
      const tags = challenge.tags.split(',').map(tag => tag.trim());
      doc.text(tags.join(', '));
      doc.moveDown(1);
    }

    // Pie de página
    doc.fontSize(9).fillColor('#999');
    doc.text(`Generado el: ${new Date().toLocaleString('es-ES')}`, {
      align: 'center',
      y: doc.page.height - 30
    });

    doc.end();
  });
});

// ===== RUTAS DE ADMINISTRACIÓN =====

// GET - Listar archivos disponibles para cargar
app.get('/api/admin/available-files', (req, res) => {
  const files = [];
  const dir = __dirname;
  
  try {
    const fileList = fs.readdirSync(dir);
    const insertFiles = fileList.filter(file => file.startsWith('insert_') && file.endsWith('.js'));
    
    insertFiles.forEach(file => {
      files.push({
        name: file,
        path: path.join(dir, file),
        type: file.includes('sql') ? 'SQL' : file.includes('python') ? 'Python' : 'Challenges'
      });
    });
    
    res.json(files);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET - Obtener estadísticas de la BD
app.get('/api/admin/stats', (req, res) => {
  const sql = `
    SELECT 
      COUNT(*) as total_challenges,
      COUNT(DISTINCT lenguaje) as total_languages,
      SUM(CASE WHEN complejidad = 'Fácil' THEN 1 ELSE 0 END) as easy_count,
      SUM(CASE WHEN complejidad = 'Medio' THEN 1 ELSE 0 END) as medium_count,
      SUM(CASE WHEN complejidad = 'Difícil' THEN 1 ELSE 0 END) as hard_count
    FROM challenges
  `;
  
  db.get(sql, [], (err, row) => {
    if (err) {
      console.error('Error en query:', err);
      return res.status(500).json({ error: err.message });
    }
    
    // Asegurar que los valores sean números y no null
    const stats = {
      total_challenges: row?.total_challenges || 0,
      total_languages: row?.total_languages || 0,
      easy_count: row?.easy_count || 0,
      medium_count: row?.medium_count || 0,
      hard_count: row?.hard_count || 0
    };
    
    res.json(stats);
  });
});

// POST - Cargar datos desde archivo
app.post('/api/admin/load-data', (req, res) => {
  const { filename } = req.body;
  
  if (!filename || !filename.startsWith('insert_') || !filename.endsWith('.js')) {
    return res.status(400).json({ error: 'Nombre de archivo inválido' });
  }
  
  const filepath = path.join(__dirname, filename);
  
  // Verificar que el archivo existe y está en el directorio correcto
  if (!fs.existsSync(filepath) || !filepath.startsWith(__dirname)) {
    return res.status(404).json({ error: 'Archivo no encontrado' });
  }
  
  // Ejecutar el archivo como proceso hijo para evitar errores que maten el servidor
  const child = spawn('node', [filepath], {
    cwd: __dirname,
    stdio: ['ignore', 'pipe', 'pipe']
  });

  let stdout = '';
  let stderr = '';

  child.stdout.on('data', (data) => {
    stdout += data.toString();
  });

  child.stderr.on('data', (data) => {
    stderr += data.toString();
  });

  child.on('close', (code) => {
    if (code === 0) {
      res.json({ 
        message: `Datos cargados desde ${filename} exitosamente`,
        output: stdout
      });
    } else {
      res.status(500).json({ 
        error: `Error al cargar datos: ${stderr || 'Error desconocido'}`,
        code: code
      });
    }
  });

  child.on('error', (error) => {
    res.status(500).json({ error: `Error al ejecutar archivo: ${error.message}` });
  });
});

// GET - Generar respaldo de la BD en formato DDL + INSERT
app.get('/api/admin/backup', (req, res) => {
  try {
    let backup = '';
    
    // Encabezado
    backup += `-- Respaldo de Challenge Manager Academy\n`;
    backup += `-- Generado el: ${new Date().toLocaleString('es-ES')}\n`;
    backup += `-- Total de challenges: `;
    
    // Obtener información de la tabla y los datos
    db.serialize(() => {
      // Obtener DDL de la tabla
      db.get("SELECT sql FROM sqlite_master WHERE type='table' AND name='challenges'", [], (err, row) => {
        if (err) {
          return res.status(500).json({ error: err.message });
        }
        
        let ddlSql = row.sql;
        
        // Obtener todos los datos
        db.all('SELECT * FROM challenges ORDER BY id', [], (err, rows) => {
          if (err) {
            return res.status(500).json({ error: err.message });
          }
          
          // Agregar DDL
          backup += rows.length + '\n\n';
          backup += '-- ===== DDL (Estructura) =====\n\n';
          backup += `DROP TABLE IF EXISTS challenges;\n`;
          backup += ddlSql + ';\n\n';
          
          // Agregar INSERTs
          backup += '-- ===== INSERTS (Datos) =====\n\n';
          
          rows.forEach(row => {
            const values = [
              `'${row.nombre_challenge.replace(/'/g, "''")}'`,
              row.descripcion_challenge ? `'${row.descripcion_challenge.replace(/'/g, "''")}'` : 'NULL',
              row.lenguaje ? `'${row.lenguaje}'` : 'NULL',
              row.complejidad ? `'${row.complejidad}'` : 'NULL',
              row.nivel ? `'${row.nivel}'` : 'NULL',
              row.solucion_challenge ? `'${row.solucion_challenge.replace(/'/g, "''")}'` : 'NULL',
              row.code_schema ? `'${row.code_schema.replace(/'/g, "''")}'` : 'NULL',
              row.tags ? `'${row.tags.replace(/'/g, "''")}'` : 'NULL',
              row.imagen_url ? `'${row.imagen_url}'` : 'NULL',
              row.video_demostracion ? `'${row.video_demostracion}'` : `'No disponible'`,
              row.path ? `'${row.path.replace(/'/g, "''")}'` : 'NULL',
              `datetime('${row.created_at}')`,
              `datetime('${row.updated_at}')`
            ].join(', ');
            
            backup += `INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, path, created_at, updated_at) VALUES (${values});\n`;
          });
          
          // Enviar el archivo
          res.setHeader('Content-Type', 'application/octet-stream');
          res.setHeader('Content-Disposition', `attachment; filename="challenges_backup_${new Date().getTime()}.sql"`);
          res.send(backup);
        });
      });
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// DELETE - Limpiar todos los challenges
app.delete('/api/admin/clear-all', (req, res) => {
  const { confirm } = req.body;
  
  if (confirm !== true) {
    return res.status(400).json({ error: 'Confirmación requerida' });
  }
  
  const sql = 'DELETE FROM challenges';
  
  db.run(sql, function(err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ 
      message: 'Todos los challenges han sido eliminados',
      deleted: this.changes
    });
  });
});

// DELETE - Eliminar por lenguaje
app.delete('/api/admin/clear-language/:language', (req, res) => {
  const { language } = req.params;
  const { confirm } = req.body;
  
  if (confirm !== true) {
    return res.status(400).json({ error: 'Confirmación requerida' });
  }
  
  const sql = 'DELETE FROM challenges WHERE lenguaje = ?';
  
  db.run(sql, [language], function(err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ 
      message: `Challenges de ${language} han sido eliminados`,
      deleted: this.changes
    });
  });
});

// GET - Listar archivos de respaldo disponibles
app.get('/api/admin/backup-files', (req, res) => {
  const backupDir = __dirname;
  
  try {
    const fileList = fs.readdirSync(backupDir);
    const backupFiles = fileList
      .filter(file => file.startsWith('challenges_backup_') && file.endsWith('.sql'))
      .map(file => {
        const fullPath = path.join(backupDir, file);
        const stats = fs.statSync(fullPath);
        return {
          name: file,
          path: fullPath,
          size: stats.size,
          sizeKB: (stats.size / 1024).toFixed(2),
          modified: stats.mtime,
          modifiedFormatted: new Date(stats.mtime).toLocaleString('es-ES')
        };
      })
      .sort((a, b) => b.modified - a.modified); // Ordenar por fecha descendente
    
    res.json(backupFiles);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// POST - Restaurar desde respaldo
app.post('/api/admin/restore', express.text({ limit: '50mb' }), (req, res) => {
  const sqlContent = req.body;
  
  if (!sqlContent || sqlContent.trim().length === 0) {
    return res.status(400).json({ error: 'Contenido del respaldo vacío' });
  }
  
  try {
    // Ejecutar el SQL usando sqlite3 command line
    const child = spawn('sqlite3', ['./challenges.db'], {
      cwd: __dirname,
      stdio: ['pipe', 'pipe', 'pipe']
    });

    let stdout = '';
    let stderr = '';

    child.stdout.on('data', (data) => {
      stdout += data.toString();
    });

    child.stderr.on('data', (data) => {
      stderr += data.toString();
    });

    child.on('close', (code) => {
      if (code === 0) {
        // Recargar la base de datos para que los cambios sean visibles
        res.json({ 
          message: 'Respaldo restaurado exitosamente. Por favor, recarga la página.'
        });
      } else {
        res.status(500).json({ 
          error: `Error al restaurar: ${stderr || 'Error desconocido'}`,
          code: code
        });
      }
    });

    child.on('error', (error) => {
      res.status(500).json({ error: `Error al ejecutar restauración: ${error.message}` });
    });

    // Enviar el contenido SQL
    child.stdin.write(sqlContent);
    child.stdin.end();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET - Descargar respaldo específico
app.get('/api/admin/backup-files/:filename', (req, res) => {
  const { filename } = req.params;
  
  // Validar nombre de archivo
  if (!filename.startsWith('challenges_backup_') || !filename.endsWith('.sql')) {
    return res.status(400).json({ error: 'Nombre de archivo inválido' });
  }
  
  const filepath = path.join(__dirname, filename);
  
  // Validar que el archivo está en el directorio correcto
  if (!filepath.startsWith(__dirname)) {
    return res.status(400).json({ error: 'Acceso denegado' });
  }
  
  if (!fs.existsSync(filepath)) {
    return res.status(404).json({ error: 'Archivo no encontrado' });
  }
  
  res.download(filepath);
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

// Cerrar base de datos al terminar
process.on('SIGINT', () => {
  db.close(() => {
    console.log('Base de datos cerrada');
    process.exit(0);
  });
});