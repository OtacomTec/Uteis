// Init random circles
var arr = new Array();
for (var i = 0; i < 10; i++) {
    arr[i] = {
        x:  Math.floor(Math.random() * 640),
        y:  Math.floor(Math.random() * 480),
        r:  Math.floor(Math.random() * 150 + 50),
        RB:  Math.floor(Math.random() * 255),
        GB:  Math.floor(Math.random() * 255),
        BB:  Math.floor(Math.random() * 255),
        RE:  Math.floor(Math.random() * 255),
        GE:  Math.floor(Math.random() * 255),
        BE:  Math.floor(Math.random() * 255),
        lineColor: Math.floor(Math.random() * 255)
    }
}



function rgb(r,g,b) {
    return ( r | g << 8 | b  << 16 );
}
function DrawCircle(x,y,r) {
    canvas.Ellipse(x - r,y - r,x + r, y + r);
}
function DrawCirclesGrad(x,y,r,colorBegin,colorEnd) {
    var r1 = r / Math.PI;
    var theta = 0;
    var R = colorBegin & 0x0000FF;
    var G = (colorBegin & 0x00FF00) >> 8;
    var B = (colorBegin & 0xFF0000) >> 16;
    var dR = ((colorEnd & 0x0000FF) - R) / 7;
    var dG = (((colorEnd & 0x00FF00) >> 8) - G) / 7;
    var dB = (((colorEnd & 0xFF0000) >> 16) - B) / 7;
    for (theta = 0; theta < 8; theta ++) {
        y1 = Math.sin((Math.PI / 4) * theta) * r;
        x1 = Math.cos((Math.PI / 4) * theta) * r;
        canvas.bgColor = rgb (R,G,B);
        DrawCircle(x + x1,y + y1,r1);
        R += dR;
        G += dG;
        B += dB;
    }
}

function Draw() {
    var i;
    canvas.lineWidth = 2;
    for (i = 0; i < 10; i++) {
        canvas.color = rgb(arr[i].lineColor,arr[i].lineColor,arr[i].lineColor);
        canvas.bgColor = rgb(arr[i].RB,arr[i].GB,arr[i].BB);
        DrawCircle(arr[i].x,arr[i].y,arr[i].r);
        DrawCirclesGrad(arr[i].x,arr[i].y,arr[i].r,rgb(arr[i].RB,arr[i].GB,arr[i].BB),rgb(arr[i].RE,arr[i].GE,arr[i].BE));
    }
    canvas.lineWidth = 4;
    canvas.bgColor = rgb(255,255,255);
    canvas.color = rgb(0,0,0);
    canvas.Rect(5,5,408,50);
    canvas.Write(10,10,"Sample script (JScript)");
    canvas.Line(10,35,400,35);
}
