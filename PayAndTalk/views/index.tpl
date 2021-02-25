<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Main page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body>
 % include('navbar.tpl',home=True,settings=False)


  <main class="container">
    
    % if defined("users"):
      <h1>else</h1>
    % else:
 
<div class="col text-center mt-5">
  <label for="channelJoin" class="h2">Enter channel url</label>
  <input type="url" class="form-control" id="channelJoin" placeholder="https://www.joinclubhouse.com/room/PARpwlAx">
</div>

    % end

  </main>


  
</body>
</html>