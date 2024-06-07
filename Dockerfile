# Використовуємо офіційний образ OpenJDK як базовий образ
FROM openjdk:17

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо Gradle файли
COPY gradlew ./
COPY gradle ./gradle

# Копіюємо решту файлів проекту
COPY build.gradle settings.gradle ./
COPY src ./src

# Завантажуємо всі необхідні залежності та будуємо додаток
RUN ./gradlew build

# Копіюємо збудований jar-файл у робочу директорію
COPY build/libs/HomeWorkDev2-1.0-SNAPSHOT.jar /app/HomeWorkDev2-1.0-SNAPSHOT.jar

# Відкриваємо порт для додатку
EXPOSE 8080

# Запускаємо додаток
CMD ["java", "-jar", "/app/HomeWorkDev2-1.0-SNAPSHOT.jar"]
