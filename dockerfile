# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project file and restore dependencies
COPY DevOpsPipelineTest.csproj ./
RUN dotnet restore DevOpsPipelineTest.csproj

# Copy all source files and publish
COPY . ./
RUN dotnet publish DevOpsPipelineTest.csproj -c Release -o /app/out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out ./

EXPOSE 80
ENTRYPOINT ["dotnet", "DevOpsPipelineTest.dll"]
