# start with a base image with all the necessary tooling to compile our app
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build

# set the working directory inside compilation container to c:\app
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ESBOnline/*.sln ./ESBOnline/
COPY ESBOnline/ESBOnline.csproj ./ESBOnline/
COPY ESBOnline/*.config ./ESBOnline/
COPY BLL/BLL.csproj ./BLL/
COPY ClassLibrary1/ClassLibrary1.csproj ./ClassLibrary1/
COPY ClassLibrary1/*.config ./ClassLibrary1/
COPY DAL/DAL.csproj ./DAL/
COPY DAL/*.config ./DAL/
COPY Encadrement/Encadrement.csproj ./Encadrement/
COPY PlanEtude/PlanEtude.csproj ./PlanEtude/

# restore nuget packages
RUN nuget restore ./ESBOnline/ESBOnline.sln

# copy everything else and build app
COPY . .

# msbuild to publish project folder to c:\publish, which includes only binaries and content files
RUN msbuild "ESBOnline\ESBOnline.csproj" /p:DeployOnBuild=true /p:PublishUrl="c:\publish" /p:WebPublishMethod=FileSystem /p:DeployDefaultTarget=WebPublish

# start with new base image for running asp.net apps (which contains IIS)
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime

# set default work folder to c:\inetpub\wwwroot (IIS root)
WORKDIR /inetpub/wwwroot

# copy files from bin/publish in our sdk container into c:\inetpub\wwwroot
COPY --from=build /publish. ./