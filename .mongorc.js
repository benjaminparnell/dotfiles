function clearUpTestDbs() {
  db.getMongo().getDBNames().forEach(function(database) {
   if (/^test/.test(database)) db.getMongo().getDB(database).dropDatabase()
  })
}
