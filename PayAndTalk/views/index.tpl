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
<div class="col text-center mt-3">
  <label for="channelJoin" class="h2">{{topic}}</label>
  <div class="d-flex input-group">
    <input type="url" class="form-control" id="channelJoin" value="{{url}}" readonly>
    <a href="/leave" class="btn btn-warning">Leave</a>
</div>

<div class="row">

<div class="col-md-6">
  <table class="table table-sm caption-top">
    <caption>List of payed users</caption>
    <thead>
      <tr>
        <th scope="col">Username</th>
        <th scope="col">Uptime</th>
        <th scope="col">Money</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">gornostay25</th>
        <td>2021-02-05 23:00</td>
        <td>20$</td>
        <td>

          <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
             
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="#">Ban</a></li>
              <li><a class="dropdown-item" href="#">Kick</a></li>
              <li><a class="dropdown-item" href="#">Add time</a></li>
            </ul>
          </div>
        </td>
      </tr>
      
    </tbody>
  </table>

</div>
<div class="col-md-6">
  <table class="table table-sm caption-top">
    <caption>List of banned users</caption>
    <thead>
      <tr>
        <th scope="col">Username</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">gornostay25</th>
        <td>
            <button class="btn btn-secondary " type="button">
              Unban
            </button>
        </td>
      </tr>
      
    </tbody>
  </table>

</div>

</div>

% else:
 
<div class="col text-center mt-5">
  <label for="channelJoin" class="h2">Enter channel url</label>
  <div class="d-flex input-group">
    <input type="url" class="form-control" id="channelJoin" placeholder="https://www.joinclubhouse.com/room/PARpwlAx">
    <button id="jointoch" class="btn btn-primary">Join</button>

    <!-- <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
      <span class="visually-hidden">Toggle Dropdown</span>
    </button>
    <ul class="dropdown-menu dropdown-menu-end">
      <li><a class="dropdown-item" href="#">Create room</a></li>
    </ul> -->

</div>

<table class="table table-sm mt-4">
  <thead>
    <tr>
      <th scope="col">Channel</th>
      <th scope="col">Topic</th>
      <th scope="col">Speakers</th>
      <th scope="col">All</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>    
    % for item in channels:
    <tr>
      <th scope="row"><a href="https://www.joinclubhouse.com/room/{{item["channel"]}}">{{item["channel"]}}</a></th>
      <td>{{item["topic"]}}</td>
      <td>{{item["speakers"]}}</td>
      <td>{{item["all"]}}</td>
      <td><button class="btn btn-success" onclick="JoinChannel('{{item["channel"]}}')">Join</button></td>
    </tr>
    % end

  </tbody>
</table>

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


})

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
</script>
  
</body>
</html>