var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => "Hello from DevOps Pipeline Demo 🚀");

app.Run();
