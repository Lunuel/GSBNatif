 Programme d'actualisation des lignes des tables, 
 cette mise à jour peut prendre plusieurs minutes...
<?php
require_once("../GSB_Appli_MVC_V0/gsbMVC_V0/include/fct.inc.php");
require_once ("../GSB_Appli_MVC_V0/gsbMVC_V0/include/class.pdogsb.inc.php");


$pdo = PdoGsb::getPdoGsb();

$mois = getMois(date("d/m/Y"));

$tabMois = array($mois,$mois-1,$mois-2,$mois-3,$mois-4);

$tabLibelle = array('Restaurant Chinois','Voyage scolaire', 'RDV important', 'Cinéma', 'Achat de matériel', 'Parc d\'attraction', 'Suite royale', 'Thêatre', 'Spectacle de poupées', 'RDV Pharmacie', 'RDV galant');

$tabDate = array('2018-09-12','2018-09-25', '2018-09-27', '2018-09-30', '2018-10-02', '2018-10-05', '2018-10-09', '2019-10-10','2018-10-12','2018-10-17','2018-10-20','2018-10-23','2018-05-15','2018-05-25');


set_time_limit(0);
$visiteurs = $pdo -> getVisiteurs();

foreach ($visiteurs as $visiteur) {
	$nb = rand(1,2);
	if ($nb == 1) {
		$nbfiche = rand(1,2);
		$i = 1;
		while ($i <= $nbfiche) {
			$nbMois = rand(0,count($tabMois)-1);
			$mois = $tabMois[$nbMois];
			$idVisiteur = $visiteur['id'];

			if($pdo->estPremierFraisMois($idVisiteur,$mois)){
				$pdo->creeNouvellesLignesFrais($idVisiteur,$mois);
			}
		$i++;
		}
	}
}

$lesIdFichesFrais = $pdo -> getLesIdFrais();
foreach ($lesIdFichesFrais as $uneFiche) {
	$nbFraisHorsForfait = rand(1,5);
	$idFicheFrais = $uneFiche['idFicheFrais'];

	for ($i=0; $i < $nbFraisHorsForfait; $i++) {

		$nbLibelle = rand(0, count($tabLibelle)-1);
		$nbdate = rand(0, count($tabDate)-1);

		$libelle = $tabLibelle[$nbLibelle];
		$date = $tabDate[$nbdate];
		$montant = rand(10,800);

		// Fiche de frais hors forfait
		if(!$pdo->existHorsForfait($idFicheFrais)){
			$pdo->creeNouveauFraisHorsForfait($idFicheFrais,$libelle,$date,$montant);
		}

		// Frait forfaitisés
		$lib1 = rand(0,15);
		$lib2 = rand(0,50);
		$lib3 = rand(0,25);
		$lib4 = rand(0,35);

		$lesFrais = array('id',$lib1,$lib2,$lib3,$lib4);

		$pdo -> majFraisForfait($idFicheFrais, $lesFrais);

		// Changer l'état de certaines fiches de frais
		$nbAleatoire = rand(1,3);
		if ($nbAleatoire == 3) {
			$pdo -> setEtatToCloturee($idFicheFrais);
		}
	

	}
}

?>