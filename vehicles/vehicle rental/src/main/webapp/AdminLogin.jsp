<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
       body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin: 0;
  padding: 0;
  height: 100vh;
  background: linear-gradient(to bottom, #2c003e, #005792);
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-box {
  background: rgba(0, 0, 0, 0.6);
  padding: 40px 30px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
  width: 100%;
  max-width: 380px;
  backdrop-filter: blur(12px);
  color: #fff;
}

h1 {
  text-align: center;
  color: #ffffff;
  font-size: 40px;
  margin-bottom: 0px;
}

h2 {
  text-align: center;
  color: #ffffff;
  margin-top: 10px;
  margin-bottom: 50px;
  font-size: 20px;
}

form {
  display: flex;
  flex-direction: column;
}

input {
  padding: 12px;
  margin-bottom: 20px;
  border: none;
  border-bottom: 1px solid #aaa;
  font-size: 15px;
  outline: none;
  background: transparent;
  color: #fff;
}

input::placeholder {
  color: #aaa;
}

input:focus {
  border-color: #00bcd4;
}

button {
  padding: 12px;
  background: transparent;
  border: 1px solid #00bcd4;
  color: #00bcd4;
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
  transition: all 0.3s ease;
}

button:hover {
  background-color: #00bcd4;
  color: #000;
}

.extra-links {
  text-align: center;
  margin-top: 15px;
  font-size: 14px;
  color: #aaa;
}

.extra-links a {
  color: #00bcd4;
  text-decoration: none;
  font-weight: 500;
}

.extra-links a:hover {
  text-decoration: underline;
}

    </style>
</head>
<body>
<div class="login-box">
	<h1>RentX</h1>
    <h2>Admin Login</h2>
    <form action="adminlogin" method="post">
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
    </form>
</div>

<% if (request.getAttribute("error") != null) { %>
<script>
    alert("Invalid email or password!");
</script>
<% } %>

</body>
</html>