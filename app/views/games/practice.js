<script>
var button = document.getElementById("submit")
console.log(button)
button.addEventListener("click", handleClick)

function handleClick() {
    var searchTeam = document.getElementById("Search_team")
    console.log('Searching for... ', searchTeam.value);
    getTeamGameStats(searchTeam.value)
}

function getTeamGameStats(team) {
    fetch(`https://api.collegefootballdata.com/games/teams?year=2019&team=${team}`)
        .then(response => response.json())
        .then(data => {
            console.log('Results: ', data);
            renderResults(data);
        })
}

function handleClick() {
    var searchWeek = document.getElementById("Search_week")
    console.log('Searching for... ', searchWeek.value);
    getTeamGameStats(searchWeek.value)
}

function getTeamGameStats(team) {
    fetch(`https://any-api.com/collegefootballdata_com/collegefootballdata_com/console/games/getGames`)
        .then(response => response.json())
        .then(data => {
            console.log('Results: ', data);
            renderResults(data);
        })
}

function renderResults(data) {
  var resultsBox = document.getElementById('resultsBox')
  // resultsBox.innerHTML = `<pre>${JSON.stringify(data, null, 2)}</pre>`;
  var mostRecentGame = data[0];
  var team1 = mostRecentGame.teams[0];
  var team2 = mostRecentGame.teams[1];
  resultsBox.innerHTML = `${team1.school}: ${team1.points}<br/>${team2.school}: ${team2.points}`
}
</script>