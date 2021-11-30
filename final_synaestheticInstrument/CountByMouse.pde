void updateCntByMouse() {
  float xoffset = abs(mouseX - width / 2), yoffset = abs(mouseY - height / 2);
  circleCounter = int(map(xoffset, 0, width / 2, maxCircleCount, minCircleCount));
  vertexCounter = int(map(yoffset, 0, height / 2, maxVertexCount, minVertexCount));
}

PVector getCenterByTheta(float theta, float time, float scale) {
  PVector direction = new PVector(cos(theta), sin(theta));
  float distance = 0.6 + 0.2 * cos(theta * 6.0 + cos(theta * 8.0 + time));
  PVector circleCenter = PVector.mult(direction, distance * scale);
  return circleCenter;
}

float getSizeByTheta(float theta, float time, float scale) {
  float offset = 0.2 + 0.12 * cos(theta * 9.0 - time * 2.0);
  float circleSize = scale * offset;
  return circleSize;
}

color getColorByTheta(float theta, float time) {
  float th = 8.0 * theta + time * 2.0;
  float r = /*color(127, 0, 219);*/ 0.2 + 0.5 * cos(th);
  float g = /*color(239, 213, 240);*/ 0.2 + 0.5 * cos(th - PI / 3); 
  float b = /*color(70, 0, 129);*/ 0.2 + 0.5 * cos(th - PI * 2.0 / 3.0); 
  float alpha = map(circleCounter, minCircleCount, maxCircleCount, 150, 30);
  
  return color(r * 255, g * 255, b * 255, alpha);
}
