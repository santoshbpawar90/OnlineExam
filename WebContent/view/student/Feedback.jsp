<html>
<head>
<title>Feedback Form</title>





<style type="text/css">



@import url(http://fonts.googleapis.com/css?family=Lato:300,400,700);
body {
  background-color: #e6e6e6;
  font-size: 100%;
  font-family: 'Lato', sans-serif;
  font-weight: 400;
}

div, textarea, input {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.container {
  max-width: 610px;
  min-width: 324px;
  margin: 50px auto 0px;
  background-color: #fff;
  border: 1px solid #cfcfcf;
  border-bottom: 3px solid #ccc;
}

.row {
  width: 100%;
  margin: 0 0 1em 0;
  padding: 0 2.5em;
}
.row.header {
  padding: 1.5em 2.5em;
  border-bottom: 1px solid #ccc;
  background: url(../../images/blur-city-1.jpg) left -80px;
  color: #fff;
}
.row.body {
  padding: .5em 2.5em 1em;
}

.pull-right {
  float: right;
}

h1 {
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  display: inline-block;
  font-weight: 100;
  font-size: 2.8125em;
  border-bottom: 1px solid rgba(255, 255, 255, 0.3);
  margin: 0 0 0.1em 0;
  padding: 0 0 0.4em 0;
}

h3 {
  font-family: 'Lato', sans-serif;
  font-weight: 400;
  font-size: 1.25em;
  margin: 1em 0 0.4em 0;
}

.btn {
  font-size: 1.0625em;
  display: inline-block;
  padding: 0.74em 1.5em;
  margin: 1.5em 0 0;
  color: #fff;
  border-width: 0 0 0 0;
  border-bottom: 5px solid;
  text-transform: uppercase;
  background-color: #b3b3b3;
  border-bottom-color: #8c8c8c;
  font-family: 'Lato', sans-serif;
  font-weight: 300;
}
.btn:hover {
  background-color: #bfbfbf;
}
.btn.btn-submit {
  background-color: #4f6fad;
  border-bottom-color: #374d78;
}
.btn.btn-submit:hover {
  background-color: #5f7db6;
}

form {
  max-width: 100%;
  display: block;
}
form ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
form ul li {
  margin: 0 0 0.25em 0;
  clear: both;
  display: inline-block;
  width: 100%;
}
form ul li:last-child {
  margin: 0;
  text-align: center;
}
form ul li p {
  margin: 0;
  padding: 0;
  float: left;
}
form ul li p.right {
  float: right;
}
form ul li .divider {
  margin: 0.5em 0 0.5em 0;
  border: 0;
  height: 1px;
  width: 100%;
  display: block;
  background-color: #4f6fad;
  background-image: linear-gradient(to right, #ee9cb4, #4f6fad);
}
form ul li .req {
  color: #ee9cb4;
}
form label {
  display: block;
  margin: 0 0 0.5em 0;
  color: #4f6fad;
  font-size: 1em;
}
form input {
  margin: 0 0 0.5em 0;
  border: 1px solid #ccc;
  padding: 6px 10px;
  color: #555;
  font-size: 1em;
}
form textarea {
  border: 1px solid #ccc;
  padding: 6px 10px;
  width: 100%;
  color: #555;
}
form small {
  color: #4f6fad;
  margin: 0 0 0 0.5em;
}

@media only screen and (max-width: 480px) {
  .pull-right {
    float: none;
  }

  input {
    width: 100%;
  }

  label {
    width: 100%;
    display: inline-block;
    float: left;
    clear: both;
  }

  li, p {
    width: 100%;
  }

  input.btn {
    margin: 1.5em 0 0.5em;
  }

  h1 {
    font-size: 2.25em;
  }

  h3 {
    font-size: 1.125em;
  }

  li small {
    display: none;
  }
}

</style>
</head>
<body>

<div class="container">
  <div class="row header">
    <h1>Feedback Form &nbsp;</h1>
    <h3>We would love to hear your thoughts, concerns or problems with anything so we can improve...!</h3>
  </div>
  <div class="row body">
    <form action="LoginStudent.jsp">
      <ul>
        
        <li>
          <p class="left">
            <label for="first_name">first name</label>
            <input type="text" name="first_name" placeholder="John" required="required"/>
          </p>
          <p class="pull-right">
            <label for="last_name">last name</label>
            <input type="text" name="last_name" placeholder="Smith" required="required" />      
          </p>
        </li>
        
        <li>
          <p>
            <label for="email">email <span class="req">*</span></label>
            <input type="email" name="email" placeholder="john.smith@gmail.com" required="required"/>
          </p>
        </li>        
        <li><div class="divider"></div></li>
        <li>
          <label for="comments">comments</label>
          <textarea cols="46" rows="3" name="comments" required="required"></textarea>
        </li>
        
        <li>
          <input class="btn btn-submit" type="submit" value="Submit" />
           <input class="btn btn-submit" type="button" value="Skip" onclick="window.location='LoginStudent.jsp'"/>
        
        
        </li>
       
        
      </ul>
    </form>  
  </div>
</div>


</body>

</html>