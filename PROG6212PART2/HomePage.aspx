<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PROG6212PART2.HomePage" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>EduClaim - Home</title>
<style>
  body {
    font-family: Arial, sans-serif;
    /* Set background color */
    background-color: #e0f7fa;
    /* Set a background image (replace URL with your image path) */
    background-image: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.4&auto=format&fit=crop&w=1600&q=80');
    background-size: cover; /* Make the image cover the whole background */
    background-position: center; /* Center the image */
    margin: 0;
    padding: 20px;
    height: 100vh; /* Make sure it covers the full viewport height */
    color: #333; /* Text color for contrast */
  }

  /* Optional: Add a semi-transparent overlay for better readability over the image */
  body::before {
    content: "";
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(224, 247, 250, 0.4); /* semi-transparent overlay */
    z-index: -1; /* Behind the content */
  }

  h1 {
    text-align: center;
  }

  .role-buttons {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 30px;
  }

  button {
    padding: 15px 30px;
    font-size: 16px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    background-color: #00796b;
    color: #fff;
    transition: background-color 0.3s;
  }

  button:hover {
    background-color: #004d40;
  }

  a {
    text-decoration: none;
    color: inherit;
  }
</style>
</head>
<body>

<h1 id="header">EduClaim</h1>

<div class="role-buttons">
  <button onclick="location.href='lecturer.html'">Lecturer Login</button>
  <button onclick="location.href='manager.html'">Program Manager Login</button>
  <button onclick="location.href='coordinator.html'">Coordinator Login</button>
</div>

<!-- Optional: Add a picture/image somewhere -->
<!-- Example: -->
<div style="text-align:center; margin-top:40px;">
  <img src="https://www.canva.com/design/DAGyAuKVD1k/bV2nS2c0a8Jq9Ic26oeRDw/edit#page-ehetxoa0" 
       alt="Education" style="max-width:300px; border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.2);"/>
</div>

</body>
</html>

