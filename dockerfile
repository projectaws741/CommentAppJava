# Use the latest Ubuntu image
FROM ubuntu:latest

# Set the environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y wget curl git unzip openjdk-17-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Maven 3.6.3 manually
RUN mkdir -p /opt/maven && \
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | tar -xzC /opt/maven && \
    ln -s /opt/maven/apache-maven-3.6.3 /opt/maven/latest

# Set environment variables for Maven
ENV M2_HOME=/opt/maven/latest
ENV PATH=${M2_HOME}/bin:${PATH}

# Clone the GitHub repository
RUN git clone https://github.com/srikanthmaram/CommentApp

# Set working directory for the Maven build
WORKDIR /CommentApp/AWSApp

# Run Maven to clean and package the project
RUN mvn clean package

# Run the application
CMD ["java", "-jar", "/CommentApp/AWSApp/target/AWSApp-0.0.1-SNAPSHOT.jar"]
