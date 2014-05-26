var Player = function(name) {
    this.name = name;
    this.score = 0;
};

Player.prototype.scores = function() {
    this.score++;
};



var SetState = function() {};

SetState.isDeuce = function(score1, score2) {
    return (score1 >= 3) && SetState.isEqual(score1, score2);
};

SetState.isEqual = function(score1, score2) {
    return score1 === score2;
};

SetState.isAdvantage = function(score1, score2) {
    return SetState.isAboveDeuce(score1, score2) && (SetState.diff(score1, score2) == 1);
};

SetState.isWin = function(score1, score2) {
    return SetState.isAboveDeuce(score1, score2) && (SetState.diff(score1, score2) >= 2);
};

SetState.isAboveDeuce = function(score1, score2) {
  return score1 >= 4 || score2 >= 4;
};

SetState.diff = function(score1, score2) {
    return Math.abs(score1 - score2);
};

SetState.getScoreName = function(score) {
    return ["Love", "Fifteen", "Thirty", "Forty"][score];
};



var GameStateName = function() {};

GameStateName.deuce = function() {
    return 'Deuce';
};

GameStateName.equal = function(score) {
    return SetState.getScoreName(score) + "-All";
};

GameStateName.advantage = function(name) {
    return "Advantage " + name;
};

GameStateName.win = function(name) {
    return "Win for " + name;
};

GameStateName.score = function(score1, score2) {
    return SetState.getScoreName(score1) + "-" + SetState.getScoreName(score2);
};



var TennisGame1 = function(player1Name, player2Name) {
    this.player1 = new Player(player1Name);
    this.player2 = new Player(player2Name);
};

TennisGame1.prototype.wonPoint = function(playerName) {
    if (playerName === this.player1.name) {
        this.player1.scores();
    }
    else {
        this.player2.scores();
    }
};

TennisGame1.prototype.getScore = function() {

    if (SetState.isDeuce(this.player1.score, this.player2.score)) {
        return GameStateName.deuce();



    } else if (SetState.isEqual(this.player1.score, this.player2.score)) {
        return GameStateName.equal(this.player1.score);



    } else if (SetState.isAdvantage(this.player1.score, this.player2.score)) {
        if (this.player1.score > this.player2.score) {
            return GameStateName.advantage(this.player1.name);
        } else {
            return GameStateName.advantage(this.player2.name);
        }



    } else if (SetState.isWin(this.player1.score, this.player2.score)) {
        if (this.player1.score > this.player2.score) {
            return GameStateName.win(this.player1.name);
        } else {
            return GameStateName.win(this.player2.name);
        }



    } else {
        return GameStateName.score(this.player1.score, this.player2.score);
    }
};

if (typeof window === "undefined") {
    module.exports = TennisGame1;
}