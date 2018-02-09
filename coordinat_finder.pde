// coordinat_finder
//
// Educative Processing game in which a coordinat must be found 
//
// Code by Dagmar Hofman 

float w = 10;
float h = 10;
float rX;
float rY;
enum dir {
  LO, LB, RO, RB
};
dir d;
int x;
int y;
int catchX;
int catchY;
int score = 0;
boolean showPos = false;
boolean showGrid = false;
boolean xflag = false;
void setup()
{
  size(640, 480);
  rX = random( width );
  rY = random( height );
  d = dir.LO;
  x = (int) (rX / (width / w ));
  y = (int) (rY / (height / h));
  catchX = (int) ( random(width) / (width / w ) ) ;
  catchY = (int) ( random(height) / (height / h ) ) ;
}
void draw()
{
  background(255, 255, 255);

  fill(255, 255, 255);

  int i, j;
  for ( i=0; i < width; i += width / w )
    for ( j=0; j < height; j += height / h ) {
      if (( x == (int) i / (width /w) && y == (int) j / (height /h)) )
        fill(0, 255, 0);
      else
        fill(255, 255, 255);
      rect(i, j, width / w, height / h);
      if (showGrid) {
        fill( 0, 0, 0 );
        text( " " + (int)(i/(width/w)) + " " + (int)(j/(height/h)), (i) + 5, (j) + 15 );
      }
    }

  fill(255, 0, 0);
  ellipse(rX, rY, 10, 10);

  if ( d == dir.LO ) {
    rX--;
    rY++;
  } else if ( d == dir.RO ) {
    rX++;
    rY++;
  } else if ( d == dir.RB ) {
    rX++;
    rY--;
  } else if ( d == dir.LB ) {
    rX--;
    rY--;
  }
  if ( d == dir.LB && rX < (x * ( width / w ) ))
    d = dir.RB;
  if ( d == dir.LB && rY < (y * ( height / h )) )
    d = dir.LO;

  if ( d == dir.RB && rX > ((x+1) * ( width / w ) ))
    d = dir.LB;
  if ( d == dir.RB && rY < (y * ( height / h )) )
    d = dir.RO;

  if ( d == dir.LO && rX < (x * ( width / w ) ))
    d = dir.RO;
  if ( d == dir.LO && rY > ((y+1) * ( height / h )) )
    d = dir.LB;

  if ( d == dir.RO && rX > ((x+1) * ( width / w ) ))
    d = dir.LO;
  if ( d == dir.RO && rY > ((y+1) * ( height / h )) )
    d = dir.RB;

  if (showPos)
    text("x: " + (int)x + " y: " + (int)y, 10, 10);  
  text("Ga Naar:     " + (int)catchX + " " + (int)catchY, 5, 30);
  text("Score:         " + score, 5, 40 );
  if ((int)x == catchX && (int)y == catchY ) {
    score++;
    catchX = (int) ( random(width) / (width / w ) ) ;
    catchY = (int) ( random(height) / (height / h ) ) ;
  }
}

void keyPressed()
{
  if ( key == 'i' && y > 0 ) {
    y--;
  }
  if ( key == 'm' && y < h-1 ) {
    y++;
  }
  if ( key == 'j' && x > 0 ) {
    x--;
  }
  if ( key == 'k' && x < w-1 ) {
    x++;
  }
  if ( key == 'p'  ) {
    showPos = !showPos;
  }
  if ( key == 'g'  ) {
    showGrid = !showGrid;
  }
}