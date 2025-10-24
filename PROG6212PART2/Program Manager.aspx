<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Program Manager.aspx.cs" Inherits="PROG6212PART2.Program_Manager" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Program Manager - EduClaims</title>
<style>
  body { font-family: Arial, sans-serif; background-color: #fff; margin:0; padding:20px; }
  h2 { color: #005a87; }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }
  th, td {
    border: 1px solid #ccc;
    padding: 8px;
    text-align: left;
  }
  th {
    background-color: #e0f7fa;
  }
  button {
    margin-right: 5px;
    padding: 6px 10px;
    border: none;
    background-color: #00796b;
    color: #fff;
    border-radius: 4px;
    cursor: pointer;
  }
  button:hover {
    background-color: #004d40;
  }
</style>
</head>
<body>

<h2>Pending Claims for Verification</h2>
<table id="claimsTable">
  <thead>
    <tr>
      <th>Claim ID</th>
      <th>Lecturer</th>
      <th>Hours</th>
      <th>Rate</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <!-- Data rows will be inserted here dynamically -->
  </tbody>
</table>

<script>
    // Sample claims data
    const claims = [
        { id: 1, lecturer: 'John Doe', hours: 20, rate: 10, notes: '', status: 'Pending' },
        { id: 2, lecturer: 'Jane Smith', hours: 25, rate: 15, notes: '', status: 'Pending' }
    ];

    function loadClaims() {
        const tbody = document.querySelector('#claimsTable tbody');
        tbody.innerHTML = '';

        // Filter only pending claims
        const pendingClaims = claims.filter(c => c.status === 'Pending');

        pendingClaims.forEach(c => {
            const row = document.createElement('tr');
            row.innerHTML = `
        <td>${c.id}</td>
        <td>${c.lecturer}</td>
        <td>${c.hours}</td>
        <td>${c.rate}</td>
        <td>
          <button onclick="approve(${c.id})">Approve</button>
          <button onclick="reject(${c.id})">Reject</button>
        </td>
      `;
            tbody.appendChild(row);
        });
    }

    function approve(id) {
        const claim = claims.find(c => c.id === id);
        if (claim) {
            claim.status = 'Approved';
            alert(`Claim ${id} approved.`);
            loadClaims();
        }
    }

    function reject(id) {
        const claim = claims.find(c => c.id === id);
        if (claim) {
            claim.status = 'Rejected';
            alert(`Claim ${id} rejected.`);
            loadClaims();
        }
    }

    window.onload = loadClaims;
</script>

</body>
</html>