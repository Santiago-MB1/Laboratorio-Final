// ==============================
// LABORATORIO ALGORITMIA - SKETCH COMPLETO
// ==============================

// Pantallas
int pantalla = 0;      // 0 = menú principal, 1 = miscelánea, 2 = procesos matemáticos
int Jpantalla = 0;     // 0 = menú de juegos, 1/2/3 = juegos
int Mpantalla = 0;     // 0 = menú procesos, 1/2/3 = procesos

// --------------------------------------------------
// Constantes/posiciones de botones (global para evitar repetición)
// --------------------------------------------------
float windowW = 800;
float windowH = 600;

// Botón general "Atrás"
float btnA_x = 20;
float btnA_y = 20;
float btnA_w = 110;
float btnA_h = 50;

// Botones centrar (menús)
float menuBtn_x = windowW/2 - 150;
float menuBtn_w = 300;
float menuBtn_h = 80; // para menú principal (tamaño grande)
float menuSmall_h = 70; // para sub-menus (juegos/procesos)

// Coordenadas verticales (valores usados en todo el sketch)
float menu0_y1 = 250;
float menu0_y2 = 370;

float juegos_y1 = 220;
float juegos_y2 = 320;
float juegos_y3 = 420;

float procesos_y1 = 220;
float procesos_y2 = 320;
float procesos_y3 = 420;

// --------------------------------------------------
// VARIABLES PARA PROCESO 1 (MULTIPLICACIÓN RUSA)
// --------------------------------------------------
// Etapa de entrada: 0 = pedir A, 1 = pedir B, 2 = mostrar resultado
int etapaRus = 0;
String inputA = "";
String inputB = "";
int rusA = 0;
int rusB = 0;
int resultadoRus = 0;
boolean multiplicaR = true; // evita recalcular en cada draw

// --------------------------------------------------
// VARIABLES PARA PROCESO 2 (CLAVE)
// --------------------------------------------------
int etapaClave = 0;
int clave = 0;
int numero;
boolean calculoClave = true;

// --------------------------------------------------
// VARIABLES PARA PROCESO 3 (TRIGONOMETRICAS)
// --------------------------------------------------
int xSen = width/4;
int yBT = height/2;
int xCos = width/2+50;
int Twidth = 150;
int Theight = 100;
int etapaTrigo = 0;
double respuesta;
int n = 0;
boolean sen;
float x;
boolean yaCalculo = true;

// --------------------------------------------------
// VARIABLES PARA JUEGO 1 (VIRUS)
// --------------------------------------------------

int s1 = 0;
int s2 = 0;
int s3 = 0;
int s4 = 0;
int s5 = 0;
int s6 = 0;

int Cs1 = 1;
int Cs2 = 2;
int Cs3 = 3;
int Cs4 = 4;
int Cs5 = 5;

int J1 = 10;
int J2 = 10;
int etapaVirus = 0;
boolean turno = true;

// --------------------------------------------------
// VARIABLES PARA JUEGO 2 (CLAVE)
// --------------------------------------------------
int num = int(random(1000, 10000));
int guess;
int tmp;
int tmpGuess;
int fama= 0;
int puntos=0;
boolean calcular = false;
int intento = 0;
int ultimo;

// --------------------------------------------------
// VARIABLES PARA JUEGO 3 (FLOR)
// --------------------------------------------------
boolean p1 = true;
boolean p2 = true;
boolean p3 = true;
boolean p4 = true;
boolean p5 = true;
boolean p6 = true;
boolean p7 = true;
boolean p8 = true;
boolean p9 = true;

boolean turnoP = true;
int etapaMargarita = 0;
boolean cantidad = true;
String msg = "";
int dig1 = 0;
int dig2 = 0;
// ==============================
// SETUP
// ==============================
void setup() {
  size(800, 600);
  surface.setTitle("Laboratorio Algoritmia");
  textAlign(CENTER, CENTER);
  // inicializamos valores (opcional)
}

// ==============================
// DRAW
// ==============================
void draw() {

  boolean sobreBoton = false; // para manejar el cursor

  // SWITCH principal por pantalla
  switch (pantalla) {

    // --------------------------
    // PANTALLA 0 - MENÚ PRINCIPAL
    // --------------------------
  case 0:
    background(0, 120, 200);

    fill(255);
    textSize(45);
    text("MENÚ PRINCIPAL", width/2, 100);

    // Botón Miscelánea
    float mx1 = menuBtn_x;
    float my1 = menu0_y1;
    float mw = menuBtn_w;
    float mh = menuBtn_h;

    if (mouseX > mx1 && mouseX < mx1 + mw && mouseY > my1 && mouseY < my1 + mh) {
      sobreBoton = true;
      fill(0, 150, 230); // hover
    } else {
      fill(200, 30, 30);
    }
    rect(mx1, my1, mw, mh, 20);
    fill(255);
    textSize(32);
    text("Miscelánea de Juegos", width/2, my1 + mh/2);

    // Botón Procesos Matemáticos
    float mx2 = menuBtn_x;
    float my2 = menu0_y2;

    if (mouseX > mx2 && mouseX < mx2 + mw && mouseY > my2 && mouseY < my2 + mh) {
      sobreBoton = true;
      fill(0, 150, 230);
    } else {
      fill(30, 150, 60);
    }
    rect(mx2, my2, mw, mh, 20);
    fill(255);
    text("Procesos Matemáticos", width/2, my2 + mh/2);
    break;

    // --------------------------
    // PANTALLA 1 - MISCELÁNEA
    // --------------------------
  case 1:
    background(90, 140, 70);

    // Botón ATRÁS
    if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
      sobreBoton = true;
      fill(255, 100, 100);
    } else {
      fill(200, 0, 0);
    }
    rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
    fill(255);
    textSize(20);
    text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

    // Sub-switch Jpantalla (menú de juegos / juegos)
    switch (Jpantalla) {

      // JPANTALLA 0 - menú de juegos
    case 0:
      fill(255);
      textSize(40);
      text("Miscelánea de Juegos", width/2, 120);

      float bx = menuBtn_x;
      float bw = menuBtn_w;
      float bh = menuSmall_h;

      // Juego 1
      if (mouseX > bx && mouseX < bx + bw && mouseY > juegos_y1 && mouseY < juegos_y1 + bh) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bx, juegos_y1, bw, bh, 20);
      fill(255);
      textSize(28);
      text("Juego 1", bx + bw/2, juegos_y1 + bh/2);

      // Juego 2
      if (mouseX > bx && mouseX < bx + bw && mouseY > juegos_y2 && mouseY < juegos_y2 + bh) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bx, juegos_y2, bw, bh, 20);
      fill(255);
      text("Juego 2", bx + bw/2, juegos_y2 + bh/2);

      // Juego 3
      if (mouseX > bx && mouseX < bx + bw && mouseY > juegos_y3 && mouseY < juegos_y3 + bh) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bx, juegos_y3, bw, bh, 20);
      fill(255);
      text("Juego 3", bx + bw/2, juegos_y3 + bh/2);



      break;

      // JPANTALLA 1 - Juego 1 (placeholder visual)
    case 1:
      rectMode(CORNER);
      background(70, 100, 160);
      fill(255);
      textSize(40);
      // Botón ATRÁS ya dibujado en la parte superior de esta pantalla
      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        // resaltado
        fill(255, 100, 100);
      } else {
        // botón normal (ya fue dibujado arriba; repetimos para mantener consistencia)
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Volver", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

      /////////////JUEGO 1
      if (J1==0||J2==0) {
        etapaVirus = 1;
      }
      switch(etapaVirus) {
      case 0:
        rectMode(CENTER);
        textSize(32);

        text("SERVIDORES", width/2, 60);

        int separacion = 180;
        int ancho = 120;
        int alto = 100;

        int x1 = width/2 - separacion;
        int x2 = width/2;
        int x3 = width/2 + separacion;

        int y1 = height/2 - 120;
        int y2 = height/2 + 80;

        // -------------------------
        // SERVIDOR 1
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x1, y1, ancho, alto, 12);

        fill(255);
        textSize(20);
        text("Servidor 1", x1, y1 - 20);
        text("Virus: " + s1+ " / " + Cs1, x1, y1 + 15);


        // -------------------------
        // SERVIDOR 2
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x2, y1, ancho, alto, 12);

        fill(255);
        text("Servidor 2", x2, y1 - 20);
        text("Virus: " + s2+ " / " + Cs2, x2, y1 + 15);


        // -------------------------
        // SERVIDOR 3
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x3, y1, ancho, alto, 12);

        fill(255);
        text("Servidor 3", x3, y1 - 20);
        text("Virus: " + s3+ " / " + Cs3, x3, y1 + 15);


        // -------------------------
        // SERVIDOR 4
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x1, y2, ancho, alto, 12);

        fill(255);
        text("Servidor 4", x1, y2 - 20);
        text("Virus: " + s4 + " / " + Cs4, x1, y2 + 15);


        // -------------------------
        // SERVIDOR 5
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x2, y2, ancho, alto, 12);

        fill(255);
        text("Servidor 5", x2, y2 - 20);
        text("Virus: " + s5 + " / " + Cs5, x2, y2 + 15);


        // -------------------------
        // SERVIDOR 6
        // -------------------------
        fill(80, 80, 160);
        stroke(255);
        rect(x3, y2, ancho, alto, 12);

        fill(255);
        text("Servidor 6", x3, y2 - 20);
        text("Infinito " + s6, x3, y2 + 15);


        if (turno) {
          noFill();
          rect(width/2-200, height-80, 200, 50, 100);
        } else {
          noFill();
          rect(width/2+200, height-80, 200, 50, 100);
        }

        textSize(28);
        text("Jugador 1", width/2-200, height-80);
        text("Virus: " + J1, width/2-200, height-40);

        textSize(28);
        text("Jugador 2", width/2+200, height-80);
        text("Virus: " + J2, width/2+200, height-40);
        break;
      case 1:
        if (J1== 0) {
          textSize(32);
          text("GANA EL JUGADOR 1!!", width/2, 100);
          text("Virus restantes de Jugador #2 ---> "  + J2, width/2, 150);
        } else {
          textSize(32);
          text("GANA EL JUGADOR 2!!", width/2, 100);
          text("Virus restantes de Jugador #1 ---> "  + J1, width/2, 150);
        }
        break;
      }

      rectMode(CORNER);



      break;

      // JPANTALLA 2 - Juego 2 (placeholder)
    case 2:
      background(160, 120, 60);
      fill(255);
      textSize(40);
      text("Adivina el numero", width/2, height/2-200);

      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        fill(255, 100, 100);
      } else {
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Volver", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

      if (fama!= 4) {
        textSize(28);
        text("Intento: " + inputA, width/2, height/2);

        if (calcular) {
          intento++;
          tmpGuess = guess;
          tmp = num;
          fama = 0;
          puntos = 0;
          for (int i = 0; i<4; i++) {
            int dig = tmp%10;
            int Dguess = tmpGuess%10;
            if (dig==Dguess) {
              fama++;
            }
            tmp= tmp/10;
            tmpGuess = tmpGuess/10;
          }
          tmpGuess = guess;
          tmp = num;
          for (int i = 0; i<4; i++) {
            int dig = tmp%10;
            System.out.println("DIGITO:" + dig);
            tmpGuess = guess;
            for (int j= 0; j<4; j++) {
              int digGuess = tmpGuess%10;
              if (digGuess==dig) {
                puntos++;
                tmpGuess = 0;
              }
              tmpGuess=tmpGuess/10;
            }
            tmp =tmp/10;
          }
          puntos = puntos - fama;
          calcular = false;
        }
        text("Ultimo intento: " + ultimo, width/8+50, height-50);
        noFill();
        rectMode(CENTER);
        rect(width/2, height/2, 175, 75);
        text("Intento: " + intento, width/2, height/2+200);
        text("Fama: " + fama, width/2-100, height/2+100);
        text("Puntos: " + puntos, width/2+100, height/2+100);
        rectMode(CORNER);
      } else {
        fill(255);
        textSize(40);
        text("Felicidades! Advinaste el numero: " + num, width/2, height/2);
        if (intento<3) {
          text("La clave es muy insegura", width/2, height/2+200);
        } else {
          if (intento<=6) {
            text("La clave es debil", width/2, height/2+200);
          } else {
            if (intento<=10) {
              text("La clave de seguridad moderada", width/2, height/2+200);
            } else {
              if (intento<=20) {
                text("La clave es segura", width/2, height/2+200);
              } else {
                text("La clave es muy segura", width/2, height/2+200);
              }
            }
          }
        }
      }


      break;

      // JPANTALLA 3 - Juego 3 (placeholder)
    case 3:
      background(120, 60, 160);
      fill(255);
      textSize(40);
      if (turnoP) {
        text("Turno jugador  1", width/2, height/2-250);
      } else {
        text("Turno jugador  2", width/2, height/2-250);
      }

      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        fill(255, 100, 100);
      } else {
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Volver", btnA_x + btnA_w/2, btnA_y + btnA_h/2);
      float cx = width/2;
      float cy = height/2;
      float radio = 180;
      float petaloSize = 90;

      // -----------------------------
      // PÉTALO 1 (arriba)
      // -----------------------------
      if (p1) {
        float ang1 = radians(-90);
        float px1 = cx + cos(ang1) * radio;
        float py1 = cy + sin(ang1) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px1, py1);


        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px1, py1, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#1", px1, py1);
      }

      // -----------------------------
      // PÉTALO 2
      // -----------------------------
      if (p2) {
        float ang2 = radians(-50);
        float px2 = cx + cos(ang2) * radio;
        float py2 = cy + sin(ang2) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px2, py2);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px2, py2, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#2", px2, py2);
      }

      // -----------------------------
      // PÉTALO 3
      // -----------------------------
      if (p3) {
        float ang3 = radians(-10);
        float px3 = cx + cos(ang3) * radio;
        float py3 = cy + sin(ang3) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px3, py3);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px3, py3, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#3", px3, py3);
      }

      // -----------------------------
      // PÉTALO 4
      // -----------------------------
      if (p4) {
        float ang4 = radians(30);
        float px4 = cx + cos(ang4) * radio;
        float py4 = cy + sin(ang4) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px4, py4);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px4, py4, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#4", px4, py4);
      }

      // -----------------------------
      // PÉTALO 5
      // -----------------------------
      if (p5) {
        float ang5 = radians(70);
        float px5 = cx + cos(ang5) * radio;
        float py5 = cy + sin(ang5) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px5, py5);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px5, py5, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#5", px5, py5);
      }

      // -----------------------------
      // PÉTALO 6
      // -----------------------------
      if (p6) {
        float ang6 = radians(110);
        float px6 = cx + cos(ang6) * radio;
        float py6 = cy + sin(ang6) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px6, py6);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px6, py6, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#6", px6, py6);
      }

      // -----------------------------
      // PÉTALO 7
      // -----------------------------
      if (p7) {
        float ang7 = radians(150);
        float px7 = cx + cos(ang7) * radio;
        float py7 = cy + sin(ang7) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px7, py7);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px7, py7, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#7", px7, py7);
      }

      // -----------------------------
      // PÉTALO 8
      // -----------------------------
      if (p8) {
        float ang8 = radians(190);
        float px8 = cx + cos(ang8) * radio;
        float py8 = cy + sin(ang8) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px8, py8);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px8, py8, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#8", px8, py8);
      }

      // -----------------------------
      // PÉTALO 9
      // -----------------------------
      if (p9) {
        float ang9 = radians(230);
        float px9 = cx + cos(ang9) * radio;
        float py9 = cy + sin(ang9) * radio;

        stroke(0);
        strokeWeight(3);
        line(cx, cy, px9, py9);

        fill(255, 230, 0);
        stroke(0);
        strokeWeight(4);
        ellipse(px9, py9, petaloSize, petaloSize);
        textSize(40);
        fill(0);
        text("#9", px9, py9);
      }

      // -----------------------------
      // CÍRCULO CENTRAL
      // -----------------------------
      fill(255);
      stroke(0);
      strokeWeight(4);
      ellipse(cx, cy, 60, 60);
      noStroke();
      textSize(18);

      switch(etapaMargarita) {
      case  0:
        msg = "";
        text("Presiona 1 para elegir un petalo", 125, 500);
        text("Presiona 2 para elgir dos", 100, 530);
        break;
      case 1:
        text("Toca la tecla correspondiente al numero del petalo", width/2, 550);

        break;
      case 2:
        text("Toca la tecla correspondiente a los numeros de los petalos", width/2, 550);
        fill(#EA0505);
        text(msg, width/2, 570);
        fill(255);
        break;
      case 3:
        textSize(40);
        if (turno) {
          text("Gana jugador 1", width/2, height/2-100);
        } else {
          text("Gana jugador 2", width/2, height/2-100);
        }
      }

      break;
    } // end switch Jpantalla
    break; // end case pantalla 1

    // --------------------------
    // PANTALLA 2 - PROCESOS MATEMÁTICOS
    // --------------------------
  case 2:
    background(50, 120, 120);

    // Botón ATRÁS (visible en pantalla de procesos)
    if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
      sobreBoton = true;
      fill(255, 100, 100);
    } else {
      fill(200, 0, 0);
    }
    rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
    fill(255);
    textSize(20);
    text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

    // Subswitch Mpantalla
    switch (Mpantalla) {

      // MENÚ DE PROCESOS (Mpantalla = 0)
    case 0:
      fill(255);
      textSize(40);
      text("Procesos Matemáticos", width/2, 120);

      float bxM = menuBtn_x;
      float bwM = menuBtn_w;
      float bhM = menuSmall_h;

      // Proceso 1
      if (mouseX > bxM && mouseX < bxM + bwM && mouseY > procesos_y1 && mouseY < procesos_y1 + bhM) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bxM, procesos_y1, bwM, bhM, 20);
      fill(255);
      textSize(28);
      text("Multiplicacion Rusa", bxM + bwM/2, procesos_y1 + bhM/2);

      // Proceso 2
      if (mouseX > bxM && mouseX < bxM + bwM && mouseY > procesos_y2 && mouseY < procesos_y2 + bhM) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bxM, procesos_y2, bwM, bhM, 20);
      fill(255);
      text("Clave del Numero", bxM + bwM/2, procesos_y2 + bhM/2);

      // Proceso 3
      if (mouseX > bxM && mouseX < bxM + bwM && mouseY > procesos_y3 && mouseY < procesos_y3 + bhM) {
        sobreBoton = true;
        fill(0, 150, 230);
      } else {
        fill(0, 120, 200);
      }
      rect(bxM, procesos_y3, bwM, bhM, 20);
      fill(255);
      text("Calculo Trigonometricas", bxM + bwM/2, procesos_y3 + bhM/2);

      break;

      // MPANTALLA 1 - PROCESO 1: MULTIPLICACIÓN RUSA
    case 1:
      background(20, 70, 120);
      fill(255);
      textSize(32);
      text("MULTIPLICACIÓN RUSA", width/2, 60);

      // Dibujo del botón ATRÁS de esta subpantalla (usa mismas coordenadas)
      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        fill(255, 100, 100);
      } else {
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

      // INSTRUCCIONES Y ESTADO DE ENTRADA
      textSize(18);
      textAlign(LEFT, TOP);

      if (etapaRus == 0) {
        multiplicaR = true;
        text("Paso 1: Escribe el primer número (multiplicador A) y presiona ENTER.", 40, 120);
        text("A = " + inputA, 40, 160);
      } else {
        if (etapaRus == 1) {
          text("Paso 2: Escribe el segundo número (multiplicando B) y presiona ENTER.", 40, 120);
          text("B = " + inputB, 40, 160);
        } else {
          if (etapaRus == 2) {
            // etapaRus == 2 -> mostrar resultados
            text("A = " + rusA + "       B = " + rusB, 40, 120);
            text("Proceso (cada fila: multiplicador   multiplicando):", 40, 160);

            // mostramos cada fila
            int Atemp = rusA;
            int Btemp = rusB;

            textSize(18);
            int RUSY = 200;

            while (Atemp >= 1) {
              String tmp = Atemp + "   " + Btemp;
              text(tmp, 150, RUSY);
              if (Atemp % 2 == 1 && multiplicaR) {
                resultadoRus += Btemp;
              }
              Atemp = Atemp / 2;
              Btemp = Btemp * 2;
              RUSY += 20;
            }
            multiplicaR = false;


            textSize(20);
            text("Suma (resultado) = " + resultadoRus, 60, RUSY + 10);
          }
        }
      }

      textAlign(CENTER, CENTER);
      break;

      // MPANTALLA 2 - Proceso 2 (CLAVE DE UN NUMERO)
    case 2:

      background(120, 80, 20);
      fill(255);
      textSize(40);
      text("CLAVE DE UN NUMERO", width/2, 60);

      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        fill(255, 100, 100);
      } else {
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

      switch(etapaClave) {
      case 0:
        textSize(28);
        text("Escribe el nùmero", width/2, 150);
        textSize(20);
        text(inputA, width/2, height/2);
        calculoClave = true;
        break;
      case 1:
        int dig = 0;
        int c = 1;
        numero = int(inputA);
        textSize(28);
        text("La clave del numero es:", width/2, 150);
        textSize(20);
        while (numero>0 && calculoClave) {
          c++;
          dig = numero%10;
          clave = clave + dig*c;
          numero = numero / 10;
        }
        calculoClave = false;
        text(clave, width/2, height/2);
        inputA = "";
      }

      break;
      // MPANTALLA 3 - Proceso 3 (placeholder)
    case 3:
      background(80, 20, 120);
      fill(255);
      textSize(40);
      text("Calculo de Funciones", width/2, 60);
      text("Trigonometricas", width/2, 100);
      text("con Series de Taylor", width/2, 140);
      if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
        fill(255, 100, 100);
      } else {
        fill(200, 0, 0);
      }
      rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
      fill(255);
      textSize(18);
      text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);
      //botones Sen y Cos

      switch (etapaTrigo) {
      case 0:
        xSen = width/4;
        yBT = height/2;
        xCos = width/2+50;
        Twidth = 150;
        Theight = 100;
        if (mouseX > xSen && mouseX < xSen + Twidth && mouseY > yBT && mouseY < yBT + Theight) {
          fill(255, 100, 100);
        } else {
          fill(200, 0, 0);
        }
        rect(xSen, yBT, Twidth, Theight, 15);
        fill(255);
        textSize(18);
        text("Sen(x)", xSen + Twidth/2, yBT + Theight/2);


        if (mouseX > xCos && mouseX < xCos + Twidth && mouseY > yBT && mouseY < yBT + Theight) {
          fill(255, 100, 100);
        } else {
          fill(200, 0, 0);
        }
        rect(xCos, yBT, Twidth, Theight, 15);
        fill(255);
        textSize(18);
        text("Cos(x)", xCos + Twidth/2, yBT + Theight/2);
        break;
      case 1:

        background(80, 20, 120);
        fill(255);
        textSize(30);
        text("Escribe hasta que numero quieres que se realice la sumatoria:", width/2, 140);
        text("Limite: " + inputA, width/2, height/2);


        if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
          fill(255, 100, 100);
        } else {
          fill(200, 0, 0);
        }
        rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
        fill(255);
        textSize(18);
        text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

        break;
      case 2:

        background(80, 20, 120);
        fill(255);
        textSize(30);
        text("Escribe el valor de x:", width/2, 140);
        text("X=" + inputB, width/2, height/2);
        if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
          fill(255, 100, 100);
        } else {
          fill(200, 0, 0);
        }
        rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
        fill(255);
        textSize(18);
        text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);
        break;


      case 3:
        background(80, 20, 120);
        fill(255);
        textSize(30);

        if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
          fill(255, 100, 100);
        } else {
          fill(200, 0, 0);
        }
        rect(btnA_x, btnA_y, btnA_w, btnA_h, 15);
        fill(255);
        textSize(18);
        text("Atrás", btnA_x + btnA_w/2, btnA_y + btnA_h/2);

        textSize(30);

        double prod = -1;
        double prod2 = 1;
        double prod3 = 1;
        x = radians(x);
        if (yaCalculo) {
          respuesta = 0;
          if (sen) {
            for (int i = 0; i<=n; i++) {
              prod = 1;
              prod2 = 1;
              prod3 = 1;
              for (int j = 1; j<=i; j++) {
                prod = prod * (-1);
              }
              for (int j = 1; j<=(2*i+1); j++) {
                prod2 = prod2 * j;
                prod3 = prod3 * x;
              }
              respuesta = respuesta + prod*prod3/prod2;
            }
          } else {
            for (int i = 0; i<=n; i++) {
              prod = 1;
              prod2 = 1;
              prod3 = 1;
              for (int j = 1; j<=i; j++) {
                prod = prod * (-1);
              }
              for (int j = 1; j<=(2*i); j++) {
                prod2 = prod2 * j;
                prod3 = prod3 * x;
              }
              respuesta = respuesta + prod*prod3/prod2;
            }
          }
          yaCalculo = false;
        }

        text("La respuesta es:", width/2, 140);
        text("" + respuesta, width/2, height/2);

        break;
      }

      break;
    } // end switch Mpantalla

    break; // end case pantalla 2
  } // end switch pantalla

  // Ajuste del cursor
  if (sobreBoton) cursor(HAND);
  else cursor(ARROW);
} // end draw

// ==============================
// MOUSE PRESSED — manejar clics
// ==============================
void mousePressed() {

  // usamos switch por pantalla
  switch (pantalla) {

    // PANTALLA 0 - Menú principal
  case 0:
    // coordenadas botones del menú principal
    float mx1 = menuBtn_x;
    float my1 = menu0_y1;
    float mw = menuBtn_w;
    float mh = menuBtn_h;

    float mx2 = menuBtn_x;
    float my2 = menu0_y2;

    // Si clic en Miscelánea
    if (mouseX > mx1 && mouseX < mx1 + mw && mouseY > my1 && mouseY < my1 + mh) {
      pantalla = 1;
      Jpantalla = 0;
    } else {
      // comprobar segundo botón (Procesos)
      if (mouseX > mx2 && mouseX < mx2 + mw && mouseY > my2 && mouseY < my2 + mh) {
        pantalla = 2;
      }
    }
    break;

    // PANTALLA 1 - Miscelánea
  case 1:
    // Botón ATRÁS
    if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
      // si estamos en subpantalla de juegos volvemos al menú principal, si estamos en menu de juegos volvemos a principal
      if (Jpantalla == 0) {
        pantalla = 0;
      } else {
        Jpantalla = 0;
      }
      etapaVirus = 0;
      s1 = 0;
      s2 = 0;
      s3 = 0;
      s4 = 0;
      s5 = 0;
      s6 = 0;
      turno = true;
      J1 = 10;
      J2 = 10;

      num = int(random(1000, 10000));
      fama = 0;
      puntos = 0;
      intento = 0;

      p1=true;
      p2=true;
      p3=true;
      p4=true;
      p5 = true;
      p6 = true;
      p7= true;
      p8 = true;
      p9 = true;
      etapaMargarita =  0;
      turnoP = true;
      /////
      return; //return para que no evalue nada de lo demas, sino que acabe la funcion ahi
    }

    // Si estamos en el menú de juegos (Jpantalla == 0)
    if (Jpantalla == 0) {
      float bx = menuBtn_x;
      float bw = menuBtn_w;
      float bh = menuSmall_h;

      // click vertical: comprobamos las 3 posiciones con nesting (sin else if)
      if (mouseX > bx && mouseX < bx + bw) {
        if (mouseY > juegos_y1 && mouseY < juegos_y1 + bh) {
          Jpantalla = 1; // Juego 1
        } else {
          if (mouseY > juegos_y2 && mouseY < juegos_y2 + bh) {
            Jpantalla = 2; // Juego 2
          } else {
            if (mouseY > juegos_y3 && mouseY < juegos_y3 + bh) {
              Jpantalla = 3; // Juego 3
            }
          }
        }
      }
    } else {
      // si ya estamos dentro de un juego, el botón atrás fue manejado más arriba
    }
    break;

    // PANTALLA 2 - Procesos
  case 2:
    // Botón ATRÁS general
    if (mouseX > btnA_x && mouseX < btnA_x + btnA_w && mouseY > btnA_y && mouseY < btnA_y + btnA_h) {
      // si estamos en menu de procesos volvemos al menú principal; si estamos dentro de un proceso volvemos al menú procesos
      if (Mpantalla == 0) {
        pantalla = 0;
      } else {
        Mpantalla = 0;
        // además reiniciamos entradas de todas los procesos por si acaso
        //Multiplicacion Rusa
        etapaRus = 0;
        inputA = "";
        inputB = "";
        resultadoRus = 0;
        //Clave
        etapaClave = 0;
        clave = 0;
        calculoClave = false;

        etapaTrigo= 0;
        yaCalculo = true;
      }
      return;
    }

    // Si estamos en el menú de procesos (Mpantalla == 0) detectamos cuál botón se clickeó
    if (Mpantalla == 0) {
      float bxM = menuBtn_x;
      float bwM = menuBtn_w;
      float bhM = menuSmall_h;

      if (mouseX > bxM && mouseX < bxM + bwM) {
        if (mouseY > procesos_y1 && mouseY < procesos_y1 + bhM) {
          Mpantalla = 1;

          // iniciar proceso de entrada para multiplicación rusa
          etapaRus = 0;
          inputA = "";
          inputB = "";

          resultadoRus = 0;
        } else {
          if (mouseY > procesos_y2 && mouseY < procesos_y2 + bhM) {
            Mpantalla = 2;
          } else {
            if (mouseY > procesos_y3 && mouseY < procesos_y3 + bhM) {
              Mpantalla = 3;
            }
          }
        }
      }
    }
    if (Mpantalla == 3) {
      if (mouseX > xSen && mouseX < xSen + Twidth && mouseY > yBT && mouseY < yBT + Theight) {
        etapaTrigo = 1;
        sen=true;
      }
      if (mouseX > xCos && mouseX < xCos + Twidth && mouseY > yBT && mouseY < yBT + Theight) {
        etapaTrigo = 1;
        sen = false;
      }
    }
    break;
  } // end switch pantalla
}   // end mousePressed

// ==============================
// manejo de entrada para Procesos
// ==============================
void keyPressed() {
  boolean entro = true;
  if (Jpantalla == 3 && etapaMargarita == 1) {
    if (key >= '1' && key <= '9') {
      String x1 = ""+ key;
      int x = int(x1);
      entro = false;
      turnoP = !turnoP;
      switch(x) {

      case 1:
        if (p1) {
          p1 = false;
        }
        break;

      case 2:
        if (p2) {
          p2 = false;
        }
        break;

      case 3:
        if (p3) {
          p3 = false;
        }
        break;

      case 4:
        if (p4) {
          p4 = false;
        }
        break;

      case 5:
        if (p5) {
          p5 = false;
        }
        break;

      case 6:
        if (p6) {
          p6 = false;
          ;
        }
        break;

      case 7:
        if (p7) {
          p7 = false;
        }
        break;

      case 8:
        if (p8) {
          p8 = false;
        }
        break;

      case 9:
        if (p9) {
          p9 = false;
        }
        break;
      }

      if (p1 || p2 || p3 || p4 || p5 || p6 || p7 || p8 || p9) {
        etapaMargarita = 0;
      } else {
        etapaMargarita = 3;
        System.out.println("ENTRO");
        turnoP = !turnoP;
      }
    }
  }
  if (Jpantalla == 3 && etapaMargarita == 2) {

    if (key >= '1' && key <= '9') {
      if (dig1==0) {
        String dig1S = "" + key;
        dig1 = int(dig1S);
      } else {
        String dig2S = "" + key;
        dig2 = int(dig2S);
        if (dig1-dig2 == 1 || dig2-dig1 == 1 || dig1-dig2 == 8 || dig2-dig1 == 8) {
          //ELIMINA EL PRIMER PETALO
          turnoP = !turnoP;
          entro = false;
          switch(dig1) {
          case 1:
            if (p1) {
              p1 = false;
            }
            break;

          case 2:
            if (p2) {
              p2 = false;
            }
            break;

          case 3:
            if (p3) {
              p3 = false;
            }
            break;

          case 4:
            if (p4) {
              p4 = false;
            }
            break;

          case 5:
            if (p5) {
              p5 = false;
            }
            break;

          case 6:
            if (p6) {
              p6 = false;
            }
            break;

          case 7:
            if (p7) {
              p7 = false;
            }
            break;

          case 8:
            if (p8) {
              p8 = false;
            }
            break;

          case 9:
            if (p9) {
              p9 = false;
            }
            break;
          }
          //ELIMINA EL SEGUNDO PETALO
          switch(dig2) {

          case 1:
            if (p1) {
              p1 = false;
            }
            break;

          case 2:
            if (p2) {
              p2 = false;
            }
            break;

          case 3:
            if (p3) {
              p3 = false;
            }
            break;

          case 4:
            if (p4) {
              p4 = false;
            }
            break;

          case 5:
            if (p5) {
              p5 = false;
            }
            break;

          case 6:
            if (p6) {
              p6 = false;
            }
            break;

          case 7:
            if (p7) {
              p7 = false;
            }
            break;

          case 8:
            if (p8) {
              p8 = false;
            }
            break;

          case 9:
            if (p9) {
              p9 = false;
            }
            break;
          }
          if (p1 || p2 || p3 || p4 || p5 || p6 || p7 || p8 || p9) {
            etapaMargarita = 0;
          } else {
            etapaMargarita = 3;
          }
        } else {
          msg = "Los numeros deben de estar al lado uno del otro, intenta otra vez";
          dig1 = 0;
          dig2 = 0;
          etapaMargarita = 2;
          entro = false;
        }
      }
    }
  }
  System.out.println(turnoP);
  if (Jpantalla == 3 && etapaMargarita == 0 && entro) {
    if (key == '1') {
      cantidad = true;
      etapaMargarita = 1;
    } else {
      if (key == '2')
        cantidad = false;
      etapaMargarita = 2;
      dig1=0;
      dig2=0;
    }
  }

  if (Jpantalla == 1) {
    if (key >= '0' && key <= '6') {
      // TECLA 1
      if (key == '1' ) {
        if (s1 < Cs1) {
          s1 = s1 + 1;
          if (turno) {
            J1 = J1 - 1;
          } else {
            J2 = J2 - 1;
          }
        } else {
          if (turno) {
            J1 = J1 + s1;
            s1 = 0;
          } else {
            J2 = J2 + s1;
            s1 = 0;
          }
        }
      }

      // TECLA 2
      if (key == '2' ) {
        if (s2 < Cs2) {
          s2 = s2 + 1;
          if (turno) {
            J1 = J1 - 1;
          } else {
            J2 = J2 - 1;
          }
        } else {
          if (turno) {
            J1 = J1 + s2;
            s2 = 0;
          } else {
            J2 = J2 + s2;
            s2 = 0;
          }
        }
      }

      // TECLA 3
      if (key == '3' ) {
        if (s3 < Cs3) {
          s3 = s3 + 1;
          if (turno) {
            J1 = J1 - 1;
          } else {
            J2 = J2 - 1;
          }
        } else {
          if (turno) {
            J1 = J1 + s3;
            s3 = 0;
          } else {
            J2 = J2 + s3;
            s3 = 0;
          }
        }
      }

      // TECLA 4
      if (key == '4' ) {
        if (s4 < Cs4) {
          s4 = s4 + 1;
          if (turno) {
            J1 = J1 - 1;
          } else {
            J2 = J2 - 1;
          }
        } else {
          if (turno) {
            J1 = J1 + s4;
            s4 = 0;
          } else {
            J2 = J2 + s4;
            s4 = 0;
          }
        }
      }

      // TECLA 5
      if (key == '5' ) {
        if (s5 < Cs5) {
          s5 = s5 + 1;
          if (turno) {
            J1 = J1 - 1;
          } else {
            J2 = J2 - 1;
          }
        } else {
          if (turno) {
            J1 = J1 + s5;
            s5 = 0;
          } else {
            J2 = J2 + s5;
            s5 = 0;
          }
        }
      }

      // TECLA 6
      if (key == '6' ) {
        s6 = s6 + 1;
        if (turno) {
          J1 = J1 - 1;
        } else {
          J2 = J2 - 1;
        }
      }

      turno = !turno;
    }
  }
  if (Jpantalla==2) {
    if ((key == ENTER || key == RETURN) && inputA.length()>0) {
      ultimo = guess;
      guess = int(inputA);
      calcular = true;
      inputA = "";
    }
  }
  if (pantalla == 1 && Jpantalla ==2 && inputA.length()<4) {
    if (key >= '0' && key <= '9') {
      inputA += key;
    }
  }
  if (key == BACKSPACE) {
    if (Jpantalla == 2) {
      if (inputA.length() > 0) {
        inputA = inputA.substring(0, inputA.length() - 1);
      }
    }
  }
  // Sólo atendemos teclas si estamos en la pantalla de procesos y en MPANTALLA 1 (Multiplicación Rusa)
  if (pantalla == 2 && (Mpantalla == 1 || Mpantalla == 2 || Mpantalla == 3)) {

    // Digitos
    if (key >= '0' && key <= '9') {

      if (etapaRus == 0 || etapaTrigo == 1) {
        inputA += key;
      } else {


        if (etapaRus == 1 || etapaTrigo == 2) {

          inputB += key;
        }
      }
    }

    // BACKSPACE
    if (key == BACKSPACE) {
      if (etapaRus == 0|| etapaTrigo == 1) {
        if (inputA.length() > 0) {
          inputA = inputA.substring(0, inputA.length() - 1);
        }
      } else {
        if (etapaRus == 1 || etapaTrigo == 2) {
          if (inputB.length() > 0) {
            inputB = inputB.substring(0, inputB.length() - 1);
          }
        }
      }
    }

    // ENTER / RETURN -> cambiar etapa o calcular
    if ((key == ENTER || key == RETURN) && (Mpantalla == 1 || Mpantalla ==3 || Mpantalla ==2 )) {
      if (etapaRus == 0 || etapaTrigo ==1) {
        if (inputA.length() > 0) {
          // convertir y pasar a pedir B
          rusA = int(inputA);
          etapaRus = 1;
          n = int(inputA);
          etapaTrigo = 2;
          etapaClave =1;
        }
      } else {

        if (etapaRus == 1|| etapaTrigo ==2) {
          if (inputB.length() > 0) {

            rusB = int(inputB);
            x = int(inputB);
            etapaRus = 2;

            etapaTrigo = 3;
          }
        }
      }
    }
    ////////// CLAVE DE UN NUMERO
  }
}
// end if pantalla==2 && Mpantalla==1
// end keyPressed



// ==============================
// FIN DEL SKETCH
// ==============================
