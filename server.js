const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');
const path = require('path');
const PDFDocument = require('pdfkit');
const multer = require('multer');
const fs = require('fs');

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
    tags
  } = req.body;

  const imagenUrl = req.file ? `/uploads/${req.file.filename}` : null;

  const sql = `
    INSERT INTO challenges (
      nombre_challenge, descripcion_challenge, lenguaje, complejidad,
      nivel, solucion_challenge, code_schema, tags, imagen_url
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
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
    imagenUrl
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
    tags
  } = req.body;

  let imagenUrl = null;

  if (req.file) {
    // Si se subió una nueva imagen, usar esa
    imagenUrl = `/uploads/${req.file.filename}`;
  } else if (req.body.imagen_url) {
    // Si no se subió imagen pero viene en el body, mantener la anterior
    imagenUrl = req.body.imagen_url;
  }

  const sql = `
    UPDATE challenges 
    SET nombre_challenge = ?, descripcion_challenge = ?, lenguaje = ?,
        complejidad = ?, nivel = ?, solucion_challenge = ?,
        code_schema = ?, tags = ?, imagen_url = ?, updated_at = CURRENT_TIMESTAMP
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