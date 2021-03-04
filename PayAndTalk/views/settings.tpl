<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Main page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>

.tab-content{
  width: 70%;
}

</style>

</head>
<body>
 % include('navbar.tpl',home=False,settings=True)

 <div class="container light-style flex-grow-1 container-p-y">

  <h4 class="font-weight-bold py-3 mb-4">
    Bot settings
  </h4>

  <div class="row">
    <div class="col-md-4">
    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">General</button>
      <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Profile</buttona>
      <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Messages</button>
      <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</button>
    </div>
    </div>

    <div class="tab-content col" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

          <div class="form-group">
            <label class="form-label">Sheet url</label>
            <input type="url" class="form-control mb-1" name="sheet_id"  placeholder="https://docs.google.com/spreadsheets/d/.../pub" value="{{sheet_id if defined("sheet_id") else ""}}">
          </div>
          <div class="form-group">
            <label class="form-label">Script url</label>
            <input type="url" class="form-control" name="script_id" placeholder="https://script.google.com/macros/s/.../exec" value="{{script_id if defined("script_id") else ""}}">
          </div>
          <div class="form-group">
            <label class="form-label">Script access code</label>
            <input type="password" class="form-control mb-1" name="script_acode" placeholder="SCrIpTc0d#" value="{{script_acode if defined("script_acode") else ""}}">
            <div class="alert alert-warning mt-3">
              Where can I find this information?<br>
              <a href="https://github.com/gornostay25/PayAndTalk/blob/main/SETTINGS.md">Here</a>
            </div>
          </div>
         <span>
          <div id="whait" class="alert alert-info d-none" role="alert">
            Please whait...
          </div>
          <button onclick="SaveSettings(this)" class="btn btn-primary">Save</button>
        </span> 
          
      </div>
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">...</div>
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
    </div>
  </div>

</div>


<script>
function SaveSettings(butn){
whaitlist = []
whait = document.getElementById("whait")
butn.parentNode.querySelectorAll("input").forEach(el=>{
  ({name,value} = el)
  switch (name) {
    case "sheet_id":
      
    break;
  
  }
  whaitlist.push(ffetch("/settings/"+name+"/"+value,{
    method:"post",
    credentials:"same-origin"
  }))
})
whait.innerText = "Please whait..."
whaitclass = whait.classList
whaitclass.remove("d-none")
whaitclass.add("alert-info")
whaitclass.remove("alert-success")
whaitclass.remove("alert-danger")
Promise.all(whaitlist).then(r=>{
  //hide progress
console.log(r)
whait.innerText = "Success"
whaitclass.remove("alert-info")
whaitclass.add("alert-success")
whaitclass.remove("alert-danger")
}).catch(r=>{
  //show error message
whait.innerText = "Error: "+r
whaitclass.remove("alert-info")
whaitclass.remove("alert-success")
whaitclass.add("alert-danger")
})
}

function ffetch(url,options){
  return new Promise(async (resolve,reject)=>{
    console.log("new ffech")
      resp = await fetch(url,options)
      if (!resp.ok){
        reject(await resp.text())
      }else{
        resolve(resp)
      }
  }) 
}
</script>
</body>
</html>