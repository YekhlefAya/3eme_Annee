const scoreAffichage=document.getElementById('score');
const message=document.getElementById('message');
const userChoiceP=document.getElementById('userChoice');
const computerChoiceP=document.getElementById('computerChoice');
Score=0;
ComputerScore=0;
function playGame(choice){
    const choiceTab=['pierre','papier','ciseaux'];
    const computerChoice = choiceTab[Math.floor(Math.random()*3)];
    userChoiceP.innerHTML=choice;
    computerChoiceP.innerHTML=computerChoice;
    if(choice=='papier'){
        if(computerChoice=='ciseaux'){
            ComputerScore+=1;
        }
        else if(computerChoice=='pierre'){
            Score+=1;
        }
    }
    else if(choice=='pierre'){
        if(computerChoice=='papier'){
            ComputerScore+=1;
        }
        else if(computerChoice=='ciseaux'){
            Score+=1;
        }
    }
    else if(choice=='ciseaux'){
        if(computerChoice=='papier'){
            Score+=1;
        }
        else if(computerChoice=='pierre'){
            ComputerScore+=1;
        }
    }
    scoreAffichage.innerHTML=Score+"-"+ComputerScore;
    if(ComputerScore==Score){
        message.innerHTML="Egalité!";
    }
    else if(ComputerScore>Score){
        message.innerHTML="Ordinateur a gagné!"
    }
    else{
        message.innerHTML="Vous avez gagné!"
    }
}