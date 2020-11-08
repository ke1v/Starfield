Particle[] particles = new Particle[200];

// identical use to setup in Processing IDE except for size()
void setup() {
	size(700, 700);
	background(0);

	for (int i = 0; i < particles.length; i++) {
		//Check for not null
		if (particles[i] != null) {
			continue;
		}

		if (i == 0 || Math.random() > 0.95f) {
			particles[i] = new OddballParticle();
		} else {
  		particles[i] = new Particle();
		}
	}

}

void draw() {
	background(0);
	for (int i = 0; i < particles.length; i++) {
		//Check for null
		if (particles[i] == null) {
			particles[i] = new Particle();
			continue;
		}

		if (particles[i].outOfBounds()) {
			particles[i] = new Particle();
		}

		particles[i].move();
		particles[i].show();

	}
}

void mouseClicked() {
	//Reset
	for (int i = 0; i < particles.length; i++) {
		if (i == 0 || Math.random() > 0.95f) {
			particles[i] = new OddballParticle();
		} else {
  		particles[i] = new Particle();
		}
	}
}

class Particle {
	double x, y, angle, speed, size;
	int particleColor;

	Particle() {
		//Start at center, move randomly outwards
		x = Math.random() * 5 + 345;
		y = Math.random() * 5 + 345;
		angle = Math.random() * 2 * PI;
		speed = Math.random() * 2 + 0.5f;
		size = Math.random()*6;
		particleColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
	}

	void move() {
		x += speed * Math.cos(angle);
		y += speed * Math.sin(angle);

		if (speed > 0.5f) {
			speed *= 1.01f;
		}

	}

	void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, (float)size, (float)size);
		if (size < 15) {
			size += Math.random()/8;
		}
	}

	boolean outOfBounds() {
		return (x < -10 || x > 710 || y < -10 || y > 710);
	}

}

class OddballParticle extends Particle {

	OddballParticle() {
		//Start at center, move randomly outwards
		x = Math.random() * 5 + 345;
		y = Math.random() * 5 + 345;
		angle = Math.random() * 2 * PI;
		speed = 3;
		size = 15;
		particleColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
	}

	void move() {
		//Normal move
		x += speed * Math.cos(angle);
		y += speed * Math.sin(angle);

		//Bouncing near edges
		//Top
		if (y <= 0 || y >= 680) {
			angle = 2*PI - angle;
    		speed *= 1.005f;
    		particleColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
		}

		//Left
		if (x <= 0 || x >= 680) {
			angle = PI - angle;
			speed *= 1.005f;
			particleColor = color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
		}

	}

	void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, (float)size, (float)size);
		if (size < 30) {
			size += Math.random()/12;
		}
	}

}
