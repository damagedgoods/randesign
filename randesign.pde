int cols = 8;
int rows = 5;
int margin_ext; 

int w = 600;
int h = 805;
boolean drawGrid = true;
color bg;
color fg;

int TITLE = 0;
int PARAGRAPH = 1;

void setup() {
  size(600,805);
  

  bg = color(random(255),random(255),random(255)); 
  fg = color(random(255),random(255),random(255));
  
  background(bg);
  
  margin_ext = 10+int(random(200));
  cols = 2+int(random(11));
  rows = 2+int(random(11));

  PFont font_title;
  //font = createFont("ArgestaDisplay-Regular.otf", 80);
  font_title = createFont("Salome.otf", 120);

  PFont font_paragraph;
  //font = createFont("ArgestaDisplay-Regular.otf", 80);
  font_paragraph = createFont("Bould-Light.otf", 120);

    
  stroke(fg, 50);
  int col_gap = int((w - 2*margin_ext)/cols);
  int row_gap = int((h - 2*margin_ext)/rows);  
  
  if (drawGrid) {      
    for (int i=0; i <= cols; i++) {
      line(margin_ext+i*col_gap, 0, margin_ext+i*col_gap, h);      
    }        
    for (int i=0; i <= rows; i++) {
      //line(margin_ext+i*col_gap, 0, margin_ext+i*col_gap, h);
      line(0,margin_ext+i*row_gap, w, margin_ext+i*row_gap);
    }
  }
  
  fill(fg);
  textSize(60);
  textAlign(LEFT, BASELINE);
  
  // Genero N textos
  int num_txt = int(random(5));
  for (int i=2; i<=num_txt; i++) {  
    
    int col = int(random(cols));
    int row = int(random(rows));    
    int txt_x = int(margin_ext+col*col_gap);    
    int txt_y = int(margin_ext+row*row_gap);
    
    int text_type = int(random(2));
    String txt = "";
    if (text_type == TITLE) {
      textFont(font_title, 120);
      textSize(48);
      txt = "Un Título";      
    } else if (text_type == PARAGRAPH) {
      textFont(font_paragraph, 120);
      textSize(16);
      //txt = "Un texto mucho más\nlargo";
      txt = "Morbi facilisis quam risus. Cras et vulputate leo, et mollis magna. Aenean fermentum ac nisi nec porta. Sed eget tempus ligula. Pellentesque iaculis pretium eros, et pretium purus finibus nec. Mauris pharetra mollis dolor maximus eleifend. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer placerat id metus ut accumsan. Nunc id consequat lectus. Aliquam venenatis ultrices tellus at dictum. In non urna mauris. Phasellus a dolor at ex placerat ornare. Phasellus at neque consequat, porttitor sem quis, tincidunt nibh.";

      int cols_width = int(random(cols-col)); // Columnas de ancho de la caja
      int cols_width_px = cols_width*col_gap;
      
      int box_width = 0;
      
      String[] words = splitTokens(txt);
      String temp_line = "";
      String final_txt = "";
      for (int j=0; j<words.length; j++) {
        println(words[j]);
        temp_line +=words[j]+" ";
        if (textWidth(temp_line) > cols_width_px) {
          // Quito la última palabra que añadí
          
          // Añado la línea a final_txt con retorno de carro
          final_txt += temp_line+"\n";
          
          // Reseteo temp_line con la palabra quitada
          temp_line = words[j]+" ";
        } else {          
        }
        
      }
            
      txt = final_txt;
      
}    
    
    text(txt, txt_x, txt_y);
    
    //println("Colocando palabra en "+row+": "+txt_y);
    //println(txt_x, txt_y);
  }
    
}

void draw() {

}

void mouseClicked() {
  setup();
}
