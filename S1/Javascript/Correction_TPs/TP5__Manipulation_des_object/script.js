// Un tableau pour stocker les contacts [{nom:exemple,num:0661545468},{},{}]
const repertoire = [];

function isValidPhoneNumber(number) {
  const regex = /^[0-9]{10}$/; // Un numéro de 10 chiffres selon le numéro du Maroc
  return regex.test(number);
}

function ajouterContact() {
  let nom = document.getElementById("nomContact").value.trim().toLowerCase();
  let num = document.getElementById("numeroContact").value;

  if (nom === "") {
    alert("Le nom ne peut pas être vide.");
    return;
  }

  if (!isValidPhoneNumber(num)) {
    alert("Veuillez entrer un numéro valide (10 chiffres).");
    return;
  }

  let confirmAjout = window.confirm(
    `Êtes-vous sûr de vouloir ajouter ${nom} avec le numéro ${num} ?`
  );
  if (confirmAjout) {
    let contact = { nom: nom, num: num };
    repertoire.push(contact);
    alert(`${nom} a été ajouté à votre répertoire.`);
  }

  // Réinitialiser les champs de saisie
  document.getElementById("nomContact").value = "";
  document.getElementById("numeroContact").value = "";
}

function listerContacts() {
  let liste = "Contacts :\n";
  if (repertoire.length === 0) {
    window.alert("Aucun contact dans votre répertoire.");
  } else {
    repertoire.forEach(function (contact) {
      liste += `${contact.nom} : ${contact.num}\n`;
    });
    window.alert(liste);
  }
}

function rechercheContact() {
  let nom = prompt("Donne moi le nom du contact cherché: ")
    .trim()
    .toLowerCase();

  // const numbers = [5, 12, 8, 130, 44];
  // const index = numbers.findIndex(number => number > 10);
  let index = repertoire.findIndex(function (contact) {
    return contact.nom === nom;
  });

  if (index !== -1) {
    window.alert(`Le numéro de ${nom} est: ${repertoire[index].num}`);
  } else {
    window.alert(`Aucun contact trouvé pour le nom ${nom}.`);
  }
}

function supprimerContact() {
  let nom = prompt("Donne moi le nom du contact supprimé: ")
    .trim()
    .toLowerCase();

  let index = repertoire.findIndex(function (contact) {
    return contact.nom === nom;
  });

  if (index !== -1) {
    let confirmSuppression = window.confirm(
      `Êtes-vous sûr de vouloir supprimer ${nom} ?`
    );
    if (confirmSuppression) {
      repertoire.splice(index, 1);
      window.alert(`Le contact ${nom} a été supprimé.`);
    }
  } else {
    window.alert(`Aucun contact trouvé pour le nom ${nom}.`);
  }
}
