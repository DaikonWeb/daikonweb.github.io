---
layout: default
title: Daikon Jackson XML
parent: Extensions
nav_order: 3
---

# Daikon Jackson XML

## Project
[https://github.com/DaikonWeb/daikon-jackson-xml](https://github.com/DaikonWeb/daikon-jackson-xml)

## Methods
Daikon Gson adds one method to the **Response** and one to the **Request** in order to integrate easily the XML parsing with jackson library.

### Request
`.xml<MyClass>()`: to deserialize an XML string to the desired class instance

### Response
`.xml(myInstance)`: to serialize a class instance to an XML string

## How to use
1. Define data classes with appropriate XML annotations

```
@JacksonXmlRootElement(localName = "blackjackHand")
data class BlackjackHand(
    val hiddenCard: Card = Card(),
    @JacksonXmlElementWrapper(localName = "visibleCards") val card: List<Card> = mutableListOf()
)

data class Card(val rank: Char = '1', val suit: Suit = CLUBS)

enum class Suit {
    CLUBS, DIAMONDS, HEARTS;
}
```

2. Create a server and use the data class to read and produce XML

```
@Test
fun `xml request and response`() {
    HttpServer()
        .post("/") { req, res -> res.xml(req.xml<BlackjackHand>()) }
        .start().use {
            val response = "http://localhost:4545/".http.post(
                body = """<blackjackHand><hiddenCard><rank>4</rank><suit>CLUBS</suit></hiddenCard><visibleCards><card><rank>1</rank><suit>DIAMONDS</suit></card><card><rank>7</rank><suit>HEARTS</suit></card></visibleCards></blackjackHand>"""
            )
            assertThat(response.body).isEqualTo("""<blackjackHand><hiddenCard><rank>4</rank><suit>CLUBS</suit></hiddenCard><visibleCards><card><rank>1</rank><suit>DIAMONDS</suit></card><card><rank>7</rank><suit>HEARTS</suit></card></visibleCards></blackjackHand>""")
        }
}
```
