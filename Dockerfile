FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ae-capital.csproj .
RUN dotnet restore ae-capital.csproj
COPY . .
RUN dotnet publish ae-capital.csproj -c Realesce -o /publish

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS final
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT [ "dotnet", "ae-capital.dll" ]