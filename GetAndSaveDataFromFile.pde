byte[] data= loadBytes("../google data/alarm clock.npy"); // Get The data from the file To a Binary arrey

size(280,280);    //create A window

println(data.length);
int len=(data.length-80)/784;  // 1st 80 Bit gap in a binary arrey
println(len);

int test=100;                  // Number OF testing image

byte[] outdata=new byte[test*784];  // create a Binary arrey [Each pic size 784 pixels and test image is 100]
 
int out=0;

for(int j=0;j<len;j++){
  
j=j*784 + 80; // J will pointer the next starting bit.. when j=0 thn it will point 80th bit cz its the first bit

PImage img=createImage(28,28,RGB);  // create a Image object size 28*28 and color RGB

img.loadPixels();

for(int i=0;i<784;i++){  // This Loop will copy each 784 Bit to a anathor arrey..   

    int index=i+j;    
    
    byte x=data[index];
    outdata[out]=x;    //copy Bit to OUTDATA arrey
    out++;
    img.pixels[i]=color(255-x & 0xff);  //copy bit to img pixels arrey

}
img.updatePixels();
int a= 28 * (j % 10);
int b= 28 * (j / 10);
image(img,a,b);  // print the image
}

saveBytes("AlarmClock_100.bin",outdata);
