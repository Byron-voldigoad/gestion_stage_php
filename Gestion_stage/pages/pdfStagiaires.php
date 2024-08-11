<?php
require('../fpdf.php');
require_once("connexiondb.php");

  
$nomPrenom=isset($_GET['nomPrenom'])?$_GET['nomPrenom']:"";
$idfiliere=isset($_GET['idfiliere'])?$_GET['idfiliere']:0;

$size=isset($_GET['size'])?$_GET['size']:5;
$page=isset($_GET['page'])?$_GET['page']:1;
$offset=($page-1)*$size;

$requeteFiliere="select * from filiere";

if($idfiliere==0){
    $requeteStagiaire="select idStagiaire,nom,prenom,nomFiliere,photo,civilite 
            from filiere as f,stagiaire as s
            where f.idFiliere=s.idFiliere
            and (nom like '%$nomPrenom%' or prenom like '%$nomPrenom%')
            order by idStagiaire";

}else{
     $requeteStagiaire="select idStagiaire,nom,prenom,nomFiliere,photo,civilite 
            from filiere as f,stagiaire as s
            where f.idFiliere=s.idFiliere
            and (nom like '%$nomPrenom%' or prenom like '%$nomPrenom%')
            and f.idFiliere=$idfiliere
             order by idStagiaire";

}

    $resultatStagiaire=$pdo->query($requeteStagiaire);

class PDF extends FPDF
{
// En-tête
function Header()
{

    // Police Arial gras 15
    $this->SetFont('Arial','B',15);
    // Décalage à droite
    $this->Cell(80);
    // Titre
    $this->Cell(30,10,'Liste des stagiaires');
    // Saut de ligne
    $this->Ln(20);
}

// Pied de page
function Footer()
{
    // Positionnement à 1,5 cm du bas
    $this->SetY(-15);
    // Police Arial italique 8
    $this->SetFont('Arial','I',8);
    // Numéro de page
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

//Créer l'objet de tableau
$pdf->Cell(20,10,'Num',1);
$pdf->Cell(40,10,'Nom',1);
$pdf->Cell(40,10,'Prenom',1);
$pdf->Cell(80,10,'Filiere',1);
$pdf->Ln();


//Insérer des valeurs dans le tableau
while ($filiere=$resultatStagiaire->fetch()){
    $pdf->Cell(20,10,$filiere['idStagiaire'],1);
    $pdf->Cell(40,10,$filiere['nom'],1);
    $pdf->Cell(40,10,$filiere['prenom'],1);
    $pdf->Cell(80,10,$filiere['nomFiliere'],1);
    $pdf->Ln();
}

//Générer le PDF
$pdf->Output();

?>
<!-- <!doctype html>
<html lang="en">

<head>



</head>

<body>

<?php while($stagiaire=$resultatStagiaire->fetch()){ ?>

                    <?php echo $stagiaire['idStagiaire'] ?> <br>
                    <?php echo $stagiaire['nom'] ?><br>
                    <?php echo $stagiaire['prenom'] ?> <br>
                    <?php echo $stagiaire['nomFiliere'] ?><br>
                     
                                    
 <?php }?>


</body>

</html> -->