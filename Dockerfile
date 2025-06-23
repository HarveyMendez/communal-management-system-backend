# Fase de compilación (usa SDK)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src


COPY ["CMS/CMS.sln", "CMS/"]  
COPY ["CMS/CommunalManagementSystem.API.csproj", "CMS/"]
COPY ["CommunalManagementSystem.BusinessWorkflow/CommunalManagementSystem.BusinessWorkflow.csproj", "CommunalManagementSystem.BusinessWorkflow/"]
COPY ["CommunalManagementSystem.DataAccess/CommunalManagementSystem.DataAccess.csproj", "CommunalManagementSystem.DataAccess/"]
COPY ["CommunalManagementSystem.Domain/CommunalManagementSystem.Domain.csproj", "CommunalManagementSystem.Domain/"]


RUN dotnet restore "CMS/CMS.sln"


COPY . .


RUN dotnet publish "CMS/CommunalManagementSystem.API.csproj" -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "CommunalManagementSystem.API.dll", "--urls", "http://0.0.0.0:8080"]
