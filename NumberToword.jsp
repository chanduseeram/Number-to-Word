<%@ page import="com.example.utils.NumberToWord" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Number to Word Converter</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <style>


* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #f2f4f8;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
}

.converter-box {
  background: #fff;
  width: 100%;
  max-width: 500px;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  gap: 16px;
}

h2 {
  font-size: 1.5rem;
  color: #333;
  text-align: center;
}

.input-wrapper {
  position: relative;
}

.input-wrapper .search-icon {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 18px;
  color: #aaa;
}

.input-wrapper input {
  width: 100%;
  padding: 12px 12px 12px 38px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 8px;
  outline: none;
}

button {
  width: 100%;
  padding: 12px;
  font-size: 16px;
  border: none;
  border-radius: 8px;
  background-color: deepskyblue;
  color: white;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

button:hover {
  background-color: #0056b3;
}

#result {
  font-size: 1rem;
  color: #333;
  padding: 12px;
  background: #f9f9f9;
  border-radius: 8px;
  word-break: break-word;
}

/* ==========================
   📱 MOBILE: Small (<= 375px)
========================== */
@media (max-width: 375px) {
  .converter-box {
    padding: 16px;
    max-width: 100%;
  }

  h2 {
    font-size: 1.2rem;
  }

  input,
  button,
  #result {
    font-size: 14px;
  }
}

/* ==========================
   📱 MOBILE: Medium (376px–425px)
========================== */
@media (min-width: 376px) and (max-width: 425px) {
  .converter-box {
    padding: 18px;
    max-width: 100%;
  }

  h2 {
    font-size: 1.25rem;
  }

  input,
  button,
  #result {
    font-size: 15px;
  }
}

/* ==========================
   📱 MOBILE: Large (426px–767px)
========================== */
@media (min-width: 426px) and (max-width: 767px) {
  .converter-box {
    padding: 20px;
  }

  h2 {
    font-size: 1.35rem;
  }

  input,
  button,
  #result {
    font-size: 15.5px;
  }
}

/* ==========================
   📱 TABLET (768px–1023px)
========================== */
@media (min-width: 768px) and (max-width: 1023px) {
  .converter-box {
    padding: 24px;
    max-width: 600px;
  }

  h2 {
    font-size: 1.5rem;
  }

  input,
  button,
  #result {
    font-size: 16px;
  }
}

/* ==========================
   💻 DESKTOP (1024px+)
========================== */
@media (min-width: 1024px) {
  .converter-box {
    padding: 28px;
    max-width: 700px;
  }

  h2 {
    font-size: 1.75rem;
  }

  input,
  button,
  #result {
    font-size: 17px;
  }
}
		
    
  </style>
  <script>
  document.getElementById('convertForm').addEventListener('submit', function(e) {
    const number = parseInt(document.getElementById('numberInput').value.trim());
    const resultBox = document.getElementById('result');

    if (isNaN(number) || number < 0 || number > 2147483647) {
      resultBox.textContent = "Please enter a valid number (0 - 2147483647)";
      return;
    }

    // Call to backend (if you integrate it)
    fetch(`NumberToWord.jsp?number=${number}`)
      .then(response => response.text())
      .then(data => {
        resultBox.textContent = data.trim();
      })
      .catch(() => {
        resultBox.textContent = "Error occurred while converting.";
      });
  });
</script>
</head>
<body>

<div class="converter-box">
  <h2>Number to Words</h2>
  <form id="convertForm" method="get">
    <div class="input-wrapper">
      <input type="tel" id="number" name="number" maxlength="10" placeholder="Enter a number" required><br><br>
    </div>
    <button type="submit">Convert</button>


<%
String input = request.getParameter("number");
if (input != null && !input.isEmpty()) {
    try {
        int number = Integer.parseInt(input);
        NumberToWord converter = new NumberToWord();
        String result = converter.test(number); 
        String resultFull = number +" : "+ result;
    
%>
	<div id="result"><%= resultFull %></div>
  </form>
</div>
<%
    }
    catch (NumberFormatException e) {
        out.println("<p style='color:red;'>Please enter number below : 2,147,483,647</p>");
    }
}

%>
</body>
</html>