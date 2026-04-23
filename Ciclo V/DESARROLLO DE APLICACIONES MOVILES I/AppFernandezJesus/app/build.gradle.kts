plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("kotlin-kapt")  // Habilitar kapt para Room
}

android {
    namespace = "com.example.appfernandezjesus"
    compileSdk = 36  // Versión del SDK para compilar la aplicación

    defaultConfig {
        applicationId = "com.example.appfernandezjesus"
        minSdk = 24  // Mínimo SDK soportado
        targetSdk = 36  // SDK de destino
        versionCode = 1  // Código de versión
        versionName = "1.0"  // Nombre de la versión

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = true  // Para minificar la aplicación en la versión release
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"  // Archivo de reglas de ProGuard
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11  // Usar Java 11
        targetCompatibility = JavaVersion.VERSION_11  // Usar Java 11
    }

    kotlinOptions {
        jvmTarget = "11"  // Configuración del target JVM para Kotlin
    }

    // Habilitar ViewBinding correctamente para Gradle Kotlin DSL
    buildFeatures {
        viewBinding = true  // Esta es la forma correcta de habilitar ViewBinding
    }
}

dependencies {

    // Retrofit
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")

    // ROOM (base de datos SQLite)
    implementation("androidx.room:room-runtime:2.4.2")
    implementation("androidx.room:room-ktx:2.4.2")
    kapt("androidx.room:room-compiler:2.4.2")  // Habilitar kapt para Room

    // Dependencias adicionales
    implementation("androidx.core:core-ktx:1.10.1")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.10.0")
    implementation("androidx.activity:activity-ktx:1.8.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")

    // Dependencias para Retrofit
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")

    // Dependencias para Glide
    implementation("com.github.bumptech.glide:glide:4.14.2")
    annotationProcessor("com.github.bumptech.glide:compiler:4.14.2")

    // Dependencias para pruebas
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
}