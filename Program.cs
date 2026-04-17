var builder = WebApplication.CreateBuilder(args);

// Force app to listen on port 80
builder.WebHost.UseUrls("http://+:80");

var app = builder.Build();

app.MapGet("/", () => "Hello from DevOps Pipeline Demo 🚀");

app.Run();