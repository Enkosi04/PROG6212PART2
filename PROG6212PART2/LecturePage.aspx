<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturePage.aspx.cs" Inherits="PROG6212PART2.LecturePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Lecturer Claims - EduClaim</title>
<style>
  body { font-family: Arial, sans-serif; background-color: #fff; margin:0; padding:20px; }
  h2 { color: #005a87; }
  form { max-width: 600px; margin-top:20px; }
  label { display:block; margin-top:10px; }
  input, textarea { width: 100%; padding:8px; margin-top:5px; }
  button { margin-top:15px; padding:10px 20px; font-size:16px; cursor:pointer; background-color:#005a87; color:#fff; border:none; }
  #claimsList { margin-top:30px; }
  .claim { border:1px solid #ccc; padding:10px; margin-bottom:10px; }
  /* Style for the grid/table */
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 40px;
  }
  th, td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
  }
  th {
    background-color: #e0f7fa;
  }
</style>
</head>
<body>

<h2>Submit Your Claim</h2>
<form id="claimForm">
    <label for="lectureName">Lecture Name:</label>
    <input type="text" id="lectureName" required />

    <label for="moduleName">Module Name:</label>
    <input type="text" id="moduleName" required />

    <label for="programName">Program Name:</label>
    <input type="text" id="programName" required />

    <label for="date">Date:</label>
    <input type="date" id="date" required />

    <label for="hourlyRate">Hourly Rate:</label>
    <input type="number" id="hourlyRate" required />

    <label for="tasks">Tasks:</label>
    <textarea id="tasks" rows="3" required></textarea>

    <label for="hours">Hours Worked:</label>
    <input type="number" id="hours" required />

    <label for="rate">Hourly Rate:</label>
    <input type="number" id="rate" required />

    <label for="notes">Additional Notes:</label>
    <textarea id="notes" rows="3"></textarea>

    <label for="file">Upload Supporting Document:</label>
    <input type="file" id="file" />

    <button type="button" onclick="submitClaim()">Submit Claim</button>
</form>

<h3>Your Claims</h3>
<div id="claimsList"></div>

<!-- Table displaying claims in grid view -->
<h3>All Claims Summary</h3>
<table id="claimsTable">
  <thead>
    <tr>
      <th>Lecture Name</th>
      <th>Module Name</th>
      <th>Program Name</th>
      <th>Date</th>
      <th>Hourly Rate</th>
      <th>Tasks</th>
      <th>Hours</th>
      <th>Document</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <!-- Rows will be added here dynamically -->
  </tbody>
</table>

<script>
    let claims = [];

    function submitClaim() {
        const lectureName = document.getElementById('lectureName').value;
        const moduleName = document.getElementById('moduleName').value;
        const programName = document.getElementById('programName').value;
        const date = document.getElementById('date').value;
        const hourlyRate = document.getElementById('hourlyRate').value;
        const tasks = document.getElementById('tasks').value;
        const hours = document.getElementById('hours').value;
        const rate = document.getElementById('rate').value;
        const notes = document.getElementById('notes').value;
        const fileInput = document.getElementById('file');
        const file = fileInput.files[0];

        const claim = {
            id: Date.now(),
            lectureName,
            moduleName,
            programName,
            date,
            hourlyRate,
            tasks,
            hours,
            document: file ? file.name : 'No document uploaded',
            status: 'Pending'
        };
        claims.push(claim);
        displayClaims();
        addClaimToTable(claim);
        document.getElementById('claimForm').reset();
    }

    function displayClaims() {
        const listDiv = document.getElementById('claimsList');
        listDiv.innerHTML = '';
        claims.forEach(c => {
            const div = document.createElement('div');
            div.className = 'claim';
            div.innerHTML = `
        <strong>Claim ID:</strong> ${c.id}<br>
        <strong>Lecture Name:</strong> ${c.lectureName}<br>
        <strong>Module Name:</strong> ${c.moduleName}<br>
        <strong>Program Name:</strong> ${c.programName}<br>
        <strong>Date:</strong> ${c.date}<br>
        <strong>Hourly Rate:</strong> ${c.hourlyRate}<br>
        <strong>Tasks:</strong> ${c.tasks}<br>
        <strong>Hours:</strong> ${c.hours}<br>
        <strong>Document:</strong> ${c.document}<br>
        <strong>Status:</strong> ${c.status}
      `;
            listDiv.appendChild(div);
        });
    }

    function addClaimToTable(claim) {
        const tbody = document.querySelector('#claimsTable tbody');
        const row = document.createElement('tr');

        row.innerHTML = `
      <td>${claim.lectureName}</td>
      <td>${claim.moduleName}</td>
      <td>${claim.programName}</td>
      <td>${claim.date}</td>
      <td>${claim.hourlyRate}</td>
      <td>${claim.tasks}</td>
      <td>${claim.hours}</td>
      <td>${claim.document}</td>
      <td>${claim.status}</td>
    `;

        tbody.appendChild(row);
    }

    // Initialize the table if needed (e.g., load existing claims)
    // For now, it's empty until the first submission.
</script>

</body>
</html>