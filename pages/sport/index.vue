<template>
  <div class="page-container">
  <div class="button-container">
  <button class="sport-button">Bourges</button>
  <button class="sport-button">Blois</button>
  </div>
  <div class="content-rectangle">
  <div class="content-section">
  <div class="editable-field">
  <p><strong>Nom du sport:</strong></p>
  <input type="text" class="editable-input" placeholder="Nom du sport">
  </div>
  <div class="editable-field">
  <p><strong>Entrainement horaire:</strong></p>
  <div class="horraire-entry">
  <input type="text" class="editable-input" placeholder="Lieu 1">
  <input type="text" class="editable-input" placeholder="Horraire 1">
  </div>
  <div class="horraire-entry">
  <input type="text" class="editable-input" placeholder="Lieu 2">
  <input type="text" class="editable-input" placeholder="Horraire 2">
  </div>
  </div>
  <div class="editable-field">
  <p><strong>Actualités:</strong></p>
  <textarea class="editable-textarea" placeholder="Actualités..."></textarea>
  </div>
  <div class="editable-field">
  <p><strong>Événements:</strong></p>
  <textarea class="editable-textarea" placeholder="Événements..."></textarea>
  </div>
  <div class="editable-field">
  <p><strong>Responsables:</strong></p>
  <div class="responsable-container">
  <div class="responsable">
  <!-- <img src="/public/img/icone.png" alt="Photo du responsable" class="responsable-photo"> -->
  <div class="responsable-card">
  <input type="text" class="editable-input" placeholder="Nom du responsable">
  <input type="email" class="editable-input" placeholder="Email du responsable">
  </div>
  </div>
  <div class="responsable">
  <!-- <img src="/public/img/icone.png" alt="Photo du responsable" class="responsable-photo"> -->
  <div class="responsable-card">
  <input type="text" class="editable-input" placeholder="Nom du responsable">
  <input type="email" class="editable-input" placeholder="Email du responsable">
  </div>
  </div>
  <!-- Add more .responsable divs as needed -->
  </div>
  </div>
  </div>
  </div>
  </div>
  </template>
 
 <style scoped>
 .page-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px;
 }
 
 .button-container {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
 }
 
 .sport-button {
  background-color: #6A0DAD; /* Dark violet background */
  color: white; /* White text */
  border: none;
  border-radius: 5px;
  padding: 15px 30px; /* Increase padding for larger buttons */
  margin: 0 10px; /* Space between buttons */
  cursor: pointer;
  transition: background-color 0.3s;
  font-size: 1.2em; /* Increase font size for readability */
  width: 150px; /* Fixed width to ensure buttons are the same size */
  text-align: center; /* Center the text inside the button */
 }
 
 .sport-button:hover {
  background-color: #9575CD; /* Lighter violet on hover */
 }
 
 .content-rectangle {
  background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%); /* Gradient background */
  color: #4A0072; /* Dark violet text color */
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
  max-width: 800px; /* Maximum width of the rectangle */
  width: 100%; /* Full width for responsiveness */
  margin-bottom: 20px; /* Space below the rectangle */
 }
 
 .content-section {
  font-size: 1.2em;
 }
 
 .content-section p {
  margin-bottom: 10px;
 }
 
 .content-section ul {
  list-style-type: disc;
  padding-left: 20px;
  margin-bottom: 10px;
 }
 
 .editable-field {
  margin-bottom: 20px;
 }
 
 .editable-input, .editable-textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-top: 5px;
 }
 
 .editable-input:focus, .editable-textarea:focus {
  border-color: #6A0DAD; /* Dark violet border on focus */
  outline: none;
 }
 
 .editable-textarea {
  min-height: 60px;
  resize: vertical;
 }
 
 .horraire-entry {
  display: flex;
  gap: 10px;
  margin-top: 10px;
 }
 
 .horraire-entry .editable-input {
  flex: 1;
 }
 
 .responsable-container {
  display: flex;
  justify-content: space-around; /* Space out the responsibles horizontally */
  gap: 20px; /* Space between responsibles */
  margin-top: 20px;
 }
 
 .responsable {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
 }
 
 .responsable-photo {
  border-radius: 50%; /* Makes the image circular */
  width: 100px; /* Set the desired width of the photo */
  height: 100px; /* Set the desired height of the photo */
  object-fit: cover; /* Ensures the image covers the entire circle */
 }
 
 .responsable-card {
  background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%); /* Gradient background */
  color: #4A0072; /* Dark violet text color */
  padding: 15px; /* Padding for the card content */
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
  margin-top: 10px; /* Space above the card */
  width: 100%;
 }
 
 .responsable-card h3 {
  margin: 0;
 }
 
 .responsable-card p {
  margin: 5px 0 0;
 }
 </style>