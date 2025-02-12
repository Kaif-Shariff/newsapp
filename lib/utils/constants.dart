List<String> categories = ["Technology", "Sports", "Movies", "T.V Shows", "Politics", "Science"];

enum TopNews {
  topNews0(
    "https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
  ),
  topNews1(
    "https://images.unsplash.com/photo-1591154669695-5f2a8d20c089?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
  ),
  topNews2(
    "https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
  ),
  topNews3(
    "https://images.unsplash.com/photo-1611159063981-b8c8c4301869?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
  ),
  topNews4(
    "https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5ld3N8ZW58MHwxfDB8fHwy",
    "The First Bitcoin President? Tracing Trump’s Crypto Connections",
    "Crypto execs funneled millions in donations to swing this election, and now their man is in charge. Here’s how Donald Trump’s “crypto cabinet” could shape the next four years.",
  ),
  ;

  const TopNews(this.imageUrl, this.headline, this.summary);

  final String imageUrl;
  final String headline;
  final String summary;
}
