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

 % if not ismoderator:
 <div class="alert alert-danger rounded-0" role="alert">
  Bot is not a moderator!
  Please add moderator access to {{name}} ({{username}})
</div>
% end
  <main class="container">
    
    % if defined("users"):
      <h1>else</h1>
      {{users}}
    % else:
 
<div class="col text-center mt-5">
  <label for="channelJoin" class="h2">Enter channel url</label>
  <div class="d-flex input-group">
  <input type="url" class="form-control" id="channelJoin" placeholder="https://www.joinclubhouse.com/room/PARpwlAx">
  <button id="jointoch" class="btn btn-primary">Join</button>
</div>
</div>

    % end

  </main>

<script>
if(document.getElementById("jointoch")){
  document.getElementById("jointoch").addEventListener("click",()=>{
  url = document.getElementById("channelJoin")
  Cid = url.value.match(/\/room\/([a-z|A-Z|0-9]*)$/)
  if (Cid){
    url.classList.remove("is-invalid")
    url.classList.add("is-valid")
    JoinChannel(Cid[1])
  }else{
    url.classList.add("is-invalid")
  }
  
  function JoinChannel(id){
    fetch("/join/"+id,{
      method:"post",
      credentials:"same-origin"
    }).then(r=>{return r.json()})
    .then(r=>{
      alert("Please add moderator access to {{name}} ({{username}})")
      location.reload()
    })
  }

})

}
</script>
  
</body>
</html>