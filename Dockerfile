# Використовуємо офіційний образ OpenJDK як базовий образ
FROM openjdk:17-jdk-alpine

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо Gradle файли та надаємо їм права виконання
COPY --chown=root:root gradlew ./
COPY --chown=root:root gradle ./gradle

# Копіюємо решту файлів проекту
COPY build.gradle settings.gradle ./
COPY src ./src

# Встановлення версії Gradle
RUN apk add --no-cache curl unzip \
    && curl -L https://services.gradle.org/distributions/gradle-8.1.1-bin.zip -o /tmp/gradle.zip \
    && unzip -d /opt /tmp/gradle.zip \
    && rm /tmp/gradle.zip \
    && export GRADLE_HOME=/opt/gradle-8.1.1 \
    && export PATH=$PATH:$GRADLE_HOME/bin

# Завантажуємо всі необхідні залежності та будуємо додаток
RUN ./gradlew build

# Копіюємо збудований jar-файл у робочу директорію
COPY build/libs/HomeWorkDev2-1.0-SNAPSHOT.jar /app/HomeWorkDev2-1.0-SNAPSHOT.jar

# Відкриваємо порт для додатку
EXPOSE 8080

# Запускаємо додаток
CMD ["java", "-jar", "/app/HomeWorkDev2-1.0-SNAPSHOT.jar"]
