<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">PayAndTalk</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav w-100 mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link {{"active" if home else ""}}" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item me-auto">
          <a class="nav-link {{"active" if settings else ""}}" href="/settings">Settings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/leave">Leave from channel</a>
        </li>

      </ul>
    </div>
  </div>
</nav>
