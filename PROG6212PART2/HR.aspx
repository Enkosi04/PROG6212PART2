<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR.aspx.cs" Inherits="PROG6212PART2.HR" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>HR - EduClaim</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #e0f7fa;
    margin: 0;
    padding: 20px;
    color: #333;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
  }

  /* Header for the page */
  .header {
    text-align: center;
    font-size: 24px;
    margin-bottom: 10px;
  }

  /* Top section with buttons */
  .top-section {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }

  .button-container {
    display: flex;
    gap: 20px;
  }

  button {
    padding: 12px 24px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    background-color: #00796b;
    color: white;
    transition: background-color 0.3s;
  }

  button:hover {
    background-color: #004d40;
  }

  /* Subsection for submitted claims and available lectures */
  .section {
    flex: 1 1 45%;
    min-width: 200px;
  }

  /* List styles */
  ul {
    list-style-type: none;
    padding-left: 0;
  }

  li {
    background-color: #fff8e1;
    margin-bottom: 8px;
    padding: 10px;
    border-radius: 4px;
  }

  /* Grid table styles */
  .grid-container {
    margin-top: 30px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
  }

  th, td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
  }

  th {
    background-color: #ffe57f;
  }

  /* Buttons inside table */
  .table-btn {
    margin: 2px;
    padding: 6px 10px;
    font-size: 0.9em;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .edit-btn { background-color: #4caf50; color: white; }
  .delete-btn { background-color: #f44336; color: white; }
  .download-btn { background-color: #2196f3; color: white; }
  .view-btn { background-color: #ff9800; color: white; }
  .save-btn { background-color: #4caf50; color: white; margin-left: 5px; }
</style>
</head>
<body>

<div class="header">Summary Reports</div>

<div class="top-section">
  <div class="section">
    <button id="submittedClaimsBtn">Submitted Claims</button>
  </div>
  <div class="section" style="text-align:right;">
    <button id="availableLecturesBtn">Available Lectures</button>
  </div>
</div>

<!-- Section for Submitted Claims List -->
<div id="submittedClaimsSection" style="display:none; margin-bottom:20px;">
  <h3>Submitted Claims</h3>
  <ul id="submittedClaimsList">
    <li>John Doe</li>
    <li>Jane Smith</li>
  </ul>
</div>

<!-- Section for Available Lectures List -->
<div id="lecturesSection" style="display:none; margin-bottom:20px;">
  <h3>Available Lectures</h3>
  <ul id="lecturesList">
    <li>Lecture 1: Introduction to Programming</li>
    <li>Lecture 2:Advanced JavaScript and Web Development </li>
    <li>Lecture 3: Cloud Computing Fundamentals</li>
  </ul>
</div>

<!-- Tracking Claims Table -->
<div class="grid-container">
  <h3>Tracking Claims Table</h3>
  <table id="trackingClaimsTable">
    <thead>
      <tr>
        <th>Claim ID</th>
        <th>Lecturer</th>
        <th>Lecture</th>
        <th>Module</th>
        <th>Date</th>
        <th>Amount</th>
        <th>Statuses</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <!-- Sample Data Rows -->
      <tr data-claim-id="1">
        <td>1001</td>
        <td>John Doe</td>
        <td>Programming</td>
        <td>Database</td>
        <td>2023-10-01</td>
        <td class="amount">200</td>
        <td>Pending</td>
        <td>
          <button class="table-btn edit-btn" onclick="editRow(this)">Edit</button>
          <button class="table-btn delete-btn" onclick="deleteRow(this)">Delete</button>
          <button class="table-btn download-btn" onclick="downloadClaim(1)">Download</button>
          <button class="table-btn view-btn" onclick="viewReport(1)">View Report</button>
        </td>
      </tr>
      <tr data-claim-id="2">
        <td>1002</td>
        <td>Jane Smith</td>
        <td>IT Project Managment</td>
        <td>Programming Logic and Design</td>
        <td>2023-10-05</td>
        <td class="amount">180</td>
        <td>Approved</td>
        <td>
          <button class="table-btn edit-btn" onclick="editRow(this)">Edit</button>
          <button class="table-btn delete-btn" onclick="deleteRow(this)">Delete</button>
          <button class="table-btn download-btn" onclick="downloadClaim(2)">Download</button>
          <button class="table-btn view-btn" onclick="viewReport(2)">View Report</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

<script>
    // Toggle display of submitted claims list
    document.getElementById('submittedClaimsBtn').addEventListener('click', () => {
        document.getElementById('submittedClaimsSection').style.display = 'block';
        document.getElementById('lecturesSection').style.display = 'none';
    });
    // Toggle display of available lectures list
    document.getElementById('availableLecturesBtn').addEventListener('click', () => {
        document.getElementById('lecturesSection').style.display = 'block';
        document.getElementById('submittedClaimsSection').style.display = 'none';
    });

    // Edit row to inline inputs
    function editRow(btn) {
        const row = btn.closest('tr');
        if (btn.textContent === 'Edit') {
            const amountCell = row.querySelector('.amount');
            const moduleCell = row.children[3];
            const currentAmount = amountCell.textContent;
            const currentModule = moduleCell.textContent;
            amountCell.innerHTML = `<input type="number" value="${currentAmount}" style="width:80px;">`;
            moduleCell.innerHTML = `<input type="text" value="${currentModule}">`;
            btn.textContent = 'Save';
        } else {
            const amountInput = row.querySelector('.amount input');
            const moduleInput = row.children[3].querySelector('input');
            row.querySelector('.amount').textContent = amountInput.value;
            row.children[3].textContent = moduleInput.value;
            btn.textContent = 'Edit';
        }
    }

    function deleteRow(btn) {
        if (confirm('Are you sure you want to delete this claim?')) {
            btn.closest('tr').remove();
            alert('Claim deleted.');
        }
    }

    // Download claim as invoice file
    function downloadClaim(id) {
        // Find claim data
        const row = document.querySelector(`tr[data-claim-id="${id}"]`);
        if (row) {
            const claimId = row.children[0].textContent;
            const lecturer = row.children[1].textContent;
            const lecture = row.children[2].textContent;
            const module = row.children[3].textContent;
            const date = row.children[4].textContent;
            const amount = row.children[5].textContent;
            const status = row.children[6].textContent;

            // Create invoice text
            const invoiceText = `
Invoice for Claim ID: ${claimId}
Lecturer: ${lecturer}
Lecture: ${lecture}
Module: ${module}
Date: ${date}
Amount: $${amount}
Status: ${status}
            `;
            // Create a blob and trigger download
            const blob = new Blob([invoiceText], { type: 'text/plain' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `Invoice_ClaimID_${claimId}.txt`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
        } else {
            alert('Claim data not found.');
        }
    }

    // View report in new window
    function viewReport(id) {
        const row = document.querySelector(`tr[data-claim-id="${id}"]`);
        if (row) {
            const claimId = row.children[0].textContent;
            const lecturer = row.children[1].textContent;
            const lecture = row.children[2].textContent;
            const module = row.children[3].textContent;
            const date = row.children[4].textContent;
            const amount = row.children[5].textContent;
            const status = row.children[6].textContent;
            const reportContent = `
<html>
<head>
<title>Claim Report - ID ${claimId}</title>
<style>
body { font-family: Arial, sans-serif; padding: 20px; }
h2 { text-align: center; margin-bottom: 20px; }
p { margin: 10px 0; }
</style>
</head>
<body>
<h2>Claim Report - ID ${claimId}</h2>
<p><strong>Lecturer:</strong> ${lecturer}</p>
<p><strong>Lecture:</strong> ${lecture}</p>
<p><strong>Module:</strong> ${module}</p>
<p><strong>Date:</strong> ${date}</p>
<p><strong>Amount:</strong> $${amount}</p>
<p><strong>Status:</strong> ${status}</p>
</body>
</html>
            `;
            const reportWindow = window.open('', '_blank');
            reportWindow.document.write(reportContent);
            reportWindow.document.close();
        } else {
            alert('Claim not found.');
        }
    }
</script>

</body>
</html>