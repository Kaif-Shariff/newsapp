List<String> categories = ["Technology", "Sports", "Movies", "T.V Shows", "Politics", "Science", "More"];
String sampleImage = "https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
String sampleHeading = "The First Bitcoin President? Tracing Trump’s Crypto Connections";
String sampleDescription = "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.";

enum TopNews {
  topNews0(
    "https://media.wired.com/photos/67815aa7ced74e457dc3a71e/191:100/w_1280,c_limit/011025_Trumps-Crypto-Cabinet.jpg",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
    "February 11, 2025",
    "Joel Khalili",
    "Wired",
  ),
  topNews1(
    "https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
    "February 12, 2025",
    "AJ Dellinger",
    "Wired",
  ),
  topNews2(
    "https://gizmodo.com/app/uploads/2024/10/sec-bitcoin-hack-arrest.jpg",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
    "February 10, 2025",
    "Jon Brodkin, Ars Technica",
    "Yahoo Entertainment",
  ),
  topNews3(
    "https://images.unsplash.com/photo-1611159063981-b8c8c4301869?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
    "February 09, 2025",
    "Todd Feathers",
    "The Verge",
  ),
  topNews4(
    "https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5ld3N8ZW58MHwxfDB8fHwy",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
    "February 08, 2025",
    "AJ Dellinger",
    "Gizmodo.com",
  ),
  ;

  const TopNews(
    this.imageUrl,
    this.headline,
    this.description,
    this.date,
    this.authorName,
    this.publisher,
  );

  final String imageUrl;
  final String headline;
  final String description;
  final String date;
  final String authorName;
  final String publisher;
}
