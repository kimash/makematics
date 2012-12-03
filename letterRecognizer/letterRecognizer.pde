/*Kim Ash
Makematics Fall 2012
letterRecognizer - Uses a trained Support Vector Machine to letter characters in live video.

derived from:
HandletterRecognizerInteractive by Greg Borenstein, October 2012
Distributed as part of PSVM: http://makematics.com/code/psvm
Depends on HoG Processing: http://hogprocessing.altervista.org/
*/

// uses both HoG Processing and Processing-SVM
import hog.*;
import psvm.*;

PImage img;

SVM model;
int[] labels; // 1 = A, 2 = B, 3 = C, etc.
String[] trainingFilenames, testFilenames;
float[][] trainingFeatures;

PImage testImage;
double testResult = 0.0;

void setup() {
  size(200, 100); 

  // get the names of all of the files in the "train" folder
  java.io.File folder = new java.io.File(dataPath("train"));
  trainingFilenames = folder.list();

  // setup labels array with space for labels for each
  // training file
  labels = new int[trainingFilenames.length];
  trainingFeatures = new float[trainingFilenames.length][324];

  // load in the labels based on the first part of 
  // the training images' filenames
  for (int i = 0; i < trainingFilenames.length; i++) {
    println(trainingFilenames[i]);
    //ignore .DS_Store files
    if(trainingFilenames[i].equals(".DS_Store")){
      continue;
    }

    // split the filename by "-" and look at the first part
    // to decide the label
    String letterLabel = split(trainingFilenames[i], '-')[0];
    if (letterLabel.equals("A")) {
      labels[i] = 1;
    }

    if (letterLabel.equals("B")) {
      labels[i] = 2;
    }

    if (letterLabel.equals("C")) {
      labels[i] = 3;
    }

    if (letterLabel.equals("D")) {
      labels[i] = 4;
    }

    if (letterLabel.equals("E")) {
      labels[i] = 5;
    }

    if (letterLabel.equals("F")) {
      labels[i] = 6;
    }
    
    if (letterLabel.equals("G")) {
      labels[i] = 7;
    }
    
    if (letterLabel.equals("H")) {
      labels[i] = 8;
    }
    
    if (letterLabel.equals("I")) {
      labels[i] = 9;
    }
    
    if (letterLabel.equals("J")) {
      labels[i] = 10;
    }
    
    if (letterLabel.equals("K")) {
      labels[i] = 11;
    }
    
    if (letterLabel.equals("L")) {
      labels[i] = 12;
    }
    
    if (letterLabel.equals("M")) {
      labels[i] = 13;
    }
    
    if (letterLabel.equals("N")) {
      labels[i] = 14;
    }
    
    if (letterLabel.equals("O")) {
      labels[i] = 15;
    }
    
    if (letterLabel.equals("P")) {
      labels[i] = 16;
    }
    
    if (letterLabel.equals("Q")) {
      labels[i] = 17;
    }
    
    if (letterLabel.equals("R")) {
      labels[i] = 18;
    }
    
    if (letterLabel.equals("S")) {
      labels[i] = 19;
    }
    
    if (letterLabel.equals("T")) {
      labels[i] = 20;
    }
    
    if (letterLabel.equals("U")) {
      labels[i] = 21;
    }
    
    if (letterLabel.equals("V")) {
      labels[i] = 22;
    }
    
    if (letterLabel.equals("W")) {
      labels[i] = 23;
    }
    
    if (letterLabel.equals("X")) {
      labels[i] = 24;
    }
     
     if (letterLabel.equals("Y")) {
      labels[i] = 25;
    }
    
    if (letterLabel.equals("Z")) {
      labels[i] = 26;
    }

    // calculate the Histogram of Oriented Gradients for this image
    // use its results as a training vector in our SVM
    trainingFeatures[i] = gradientsForImage(loadImage("train/" + trainingFilenames[i]));
  }

  model = new SVM(this);
  SVMProblem problem = new SVMProblem();
  // HoG always gives us back 324 gradients
  // for a 50x50 image.
  problem.setNumFeatures(324);
  // load the problem with the labels and training data
  problem.setSampleData(labels, trainingFeatures);
  // train the model
  model.train(problem);
  
  // save our model file as a text file
  model.saveModel("letter_model.txt");

  // get a list of the names of the files in the "test" folder
  java.io.File testFolder = new java.io.File(dataPath("test"));
  testFilenames = testFolder.list();
  // test a new random image
  testResult = testNewImage();
}

// Function to test a new random image from the test folder
// it returns the result of the SVM classification
double testNewImage() {
  // pick a random number between 0 and the number of test images
  int imgNum = (int)random(0, testFilenames.length-1);
  // load a test image
  testImage = loadImage("test/" + testFilenames[imgNum]);
  return model.test(gradientsForImage(testImage));
}

void draw() {
  background(0);
  image(testImage, 0, 0);

  String result = "Letter is: ";

  // display the name of the letter
  // in a different color depending on
  // the result of our SVM test
  switch((int)testResult) {
  case 1:
    fill(255, 125, 125);
    result = result + "A";
    break;
  case 2:
    fill(125, 255, 125);
    result = result + "B";
    break;
  case 3:
    fill(125, 125, 255);
    result = result + "C";
    break;
  case 4:
    fill(255, 125, 125);
    result = result + "D";
    break;
  case 5:
    fill(125, 255, 125);
    result = result + "E";
    break;
  case 6:
    fill(125, 125, 255);
    result = result + "F";
    break;
  case 7:
    fill(255, 125, 125);
    result = result + "G";
    break;
  case 8:
    fill(125, 255, 125);
    result = result + "H";
    break;
  case 9:
    fill(125, 125, 255);
    result = result + "I";
    break;
  case 10:
    fill(255, 125, 125);
    result = result + "J";
    break;
  case 11:
    fill(125, 255, 125);
    result = result + "K";
    break;
  case 12:
    fill(125, 125, 255);
    result = result + "L";
    break;
  case 13:
    fill(255, 125, 125);
    result = result + "M";
    break;
  case 14:
    fill(125, 255, 125);
    result = result + "N";
    break;
  case 15:
    fill(125, 125, 255);
    result = result + "O";
    break;
  case 16:
    fill(255, 125, 125);
    result = result + "P";
    break;
  case 17:
    fill(125, 255, 125);
    result = result + "Q";
    break;
  case 18:
    fill(125, 125, 255);
    result = result + "R";
    break;  
  case 19:
    fill(255, 125, 125);
    result = result + "S";
    break;
  case 20:
    fill(125, 255, 125);
    result = result + "T";
    break;
  case 21:
    fill(125, 125, 255);
    result = result + "U";
    break; 
  case 22:
    fill(255, 125, 125);
    result = result + "V";
    break;
  case 23:
    fill(125, 255, 125);
    result = result + "W";
    break;
  case 24:
    fill(125, 125, 255);
    result = result + "X";
    break;
  case 25:
    fill(255, 125, 125);
    result = result + "Y";
    break;
  case 26:
    fill(125, 255, 125);
    result = result + "Z";
    break;   
  }

  text(result, testImage.width + 10, 20);
}

void keyPressed() {
  testResult = testNewImage();
}

// Use HoG to calculate the gradients for an image.
// We'll use this as our feature vector for our SVM.
// HoG describes the shape of the object as transitions
// between bright and dark pixels.
// This function includes a lot of verbose and ugly
// code because of the HoG library.
float[] gradientsForImage(PImage img) {
  // resize the images to a consistent size:
  //img.resize(50, 50);

  // settings for Histogram of Oriented Gradients
  // (probably don't change these)
  int window_width=64;
  int window_height=128;
  int bins = 9;
  int cell_size = 8;
  int block_size = 2;
  boolean signed = false;
  int overlap = 0;
  int stride=16;
  int number_of_resizes=5;

  // a bunch of unecessarily verbose HOG code
  HOG_Factory hog = HOG.createInstance();
  GradientsComputation gc=hog.createGradientsComputation();
  Voter voter=MagnitudeItselfVoter.createMagnitudeItselfVoter();
  HistogramsComputation hc=hog.createHistogramsComputation( bins, cell_size, cell_size, signed, voter);
  Norm norm=L2_Norm.createL2_Norm(0.1);
  BlocksComputation bc=hog.createBlocksComputation(block_size, block_size, overlap, norm);
  PixelGradientVector[][] pixelGradients = gc.computeGradients(img, this);
  Histogram[][] histograms = hc.computeHistograms(pixelGradients);
  Block[][] blocks = bc.computeBlocks(histograms);
  Block[][] normalizedBlocks = bc.normalizeBlocks(blocks);
  DescriptorComputation dc=hog.createDescriptorComputation();    

  return dc.computeDescriptor(normalizedBlocks);
}

