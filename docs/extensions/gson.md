---
layout: default
title: Daikon Gson
parent: Extensions
nav_order: 2
---

# Daikon Gson

## Project
[https://github.com/DaikonWeb/daikon-gson](https://github.com/DaikonWeb/daikon-gson)

## Methods
Daikon Gson adds one method to the **Response** and one to the **Request** in order to integrate easily the JSON functionality.

### Request
`.json<MyClass>()`: to deserialize a JSON string to the desired class instance

### Response
`.json(myInstance)`: to serialize a class instance to a JSON string

## How to use
1. Define a data class
```
data class Greeting(val say: String, val language: String)
```

2. Create a server and use the data class to read and produce JSON
```
HttpServer()
    .post("/hello") { req, res -> res.json(req.json<Greeting>()) }
    .start().use {
        val response = post(url = "http://localhost:4545/hello", json = mapOf("say" to "Ciao", "language" to "ITA"))
        assertThat(response.text).isEqualTo("""{"say":"ciao","language":"ITA"}""")
        assertThat(response.headers["Content-Type"]).isEqualTo(APPLICATION_JSON_UTF_8.asString())
    }
```

## How to deserialize Complex Types
To deserialize and serialize a complex type, for example a `LocalDate`, you can define a deserializer and a serializer in this way:

### Deserializer
You can deserialize a json request:

1. Define a data class
```
data class Appointment(val message: String, val date: LocalDate)
```

2. Create an HttpServer
```
@Test
fun `custom deserializer`() {
    HttpServer()
        .post("/remindme") { req, res ->
            val dateDeserializer = Deserializer(LocalDate::class) { json: JsonElement, _, _ -> parse(json.asString) }
            val app = req.json<Appointment>(dateDeserializer)
            res.write("""I will remind you to "${app.message}" at ${app.date.format(ofPattern("yyyy-MM-dd"))}""")
        }
        .start().use {
            val response = post(url = "http://localhost:4545/remindme", data = """{"message":"Eat a Daikon","date":"2020-01-31"}""")
            assertThat(response.text).isEqualTo("""I will remind you to "Eat a Daikon" at 2020-01-31""")
        }
}
```

### Serializer
You can serialize a response to json:

1. Define a data class
```
data class Appointment(val message: String, val date: LocalDate)
```

2. Create an HttpServer
```
@Test
fun `custom serializer`() {
    HttpServer()
        .get("/nextAppointment") { _, response ->
            val dateSerializer = Serializer(LocalDate::class) { date: LocalDate, _, _ -> JsonPrimitive(date.format(ofPattern("dd/MM/yyyy"))) }
            val app = Appointment("Eat a Daikon", parse("2020-01-31"))
            response.json(app, dateSerializer)
        }
        .start().use {
            val response = get(url = "http://localhost:4545/nextAppointment")
            assertThat(response.text).isEqualTo("""{"message":"Eat a Daikon","date":"31/01/2020"}""")
        }
}
```