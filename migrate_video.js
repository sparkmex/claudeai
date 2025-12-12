const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./challenges.db', (err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    process.exit(1);
  } else {
    console.log('Conectado a SQLite');
    migrateDatabase();
  }
});

function migrateDatabase() {
  // Verificar si la columna ya existe
  db.all("PRAGMA table_info(challenges)", [], (err, rows) => {
    if (err) {
      console.error('Error al verificar tabla:', err);
      db.close();
      process.exit(1);
    }

    const hasVideoColumn = rows.some(row => row.name === 'video_demostracion');

    if (!hasVideoColumn) {
      // Agregar la columna si no existe
      const sql = `
        ALTER TABLE challenges 
        ADD COLUMN video_demostracion TEXT DEFAULT 'No disponible'
      `;

      db.run(sql, (err) => {
        if (err) {
          console.error('Error al agregar columna:', err);
          db.close();
          process.exit(1);
        } else {
          console.log('✅ Columna video_demostracion agregada exitosamente');
          db.close();
        }
      });
    } else {
      console.log('ℹ️ La columna video_demostracion ya existe');
      db.close();
    }
  });
}
