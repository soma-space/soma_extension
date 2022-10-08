<?php

include 'header.php';

    $query_getdata = new query($SQL, "SELECT * FROM [dbo].[normalcraft]");
  
//    headers
$mess = 'Standard Crafting List';
$title = 'Standard Crafting List';
$subtitle = 'Standard Crafting List';
$descript = 'Detail and sorting order options coming soon..';

mheader($title,$subtitle,$descript);
//monheader($title,$subtitle,$descript);
//mlistheader();
//echo '<td width="458" valign="top" bgcolor="#2B333A" style="border-left-style: none; border-left-width: 0px">';
getdata($query_getdata);

function getdata($q){
      if($q->fetch()) {


          // Item name
		    $iname = $q->field('strName');
		    $ipic = $q->field('sPicNum1');
			$slottype = $q->field('sType01');
			$crafttype = $q->field('sExpType');
			$needexp = $q->field('sNeedExp');
			$maxab = $q->field('sMaxAb');
			$metal = $q->field('sMetal');
			$wood = $q->field('sWood');
			$leather = $q->field('sLeather');
			$bone = $q->field('sBone');
			$cloth = $q->field('sCloth');
			$plant = $q->field('sPlant');
			$meat = $q->field('sMeat');
			$powder = $q->field('sPowder');
			$spice = $q->field('sSpice');
			$gem = $q->field('sGems');
			
		//set types and slots 
   switch ($slottype) {
	case 0:
        $slottype = "Anywhere";
        break;
	case 1:
        $slottype = "Forge[One handed sword]";
        break;
	case 2:
        $slottype = "Forge[Two handed sword]";
        break;
	case 4:
        $slottype = "Forge Axe";
        break;
	case 5:
        $slottype = "Forge Bow";
        break;
	case 6:
        $slottype = "Forge Spear";
        break;
	case 7:
        $slottype = "Forge Knuckle";
        break;
	case 8:
        $slottype = "Forge Staff";
        break;
	case 9:
        $slottype = "Forge Armour[Top]";
        break;
	case 3:
        $slottype = "??";
        break;
	case 10:
        $slottype = "Forge Armour[Pads]";
        break;
	case 11:
        $slottype = "Forge Armour[Boots]";
        break;
	case 12:
        $slottype = "Loom[Robe]";
        break;
	case 13:
        $slottype = "Loom Clothing[Top]";
        break;
	case 14:
        $slottype = "Loom Clothing[Pads]";
        break;
	case 15:
        $slottype = "Loom[Shoes]";
        break;
	case 16:
        $slottype = "Anvil[Ring]";
        break;
	case 17:
        $slottype = "Anvil[Bracelet]";
        break;
	case 18:
        $slottype = "Anvil[Necklace]";
        break;
	case 19:
        $slottype = "Anvil[Earring]";
        break;
	case 20:
        $slottype = "Reagent Table";
        break;
	case 21:
        $slottype = "Oven[Cook]";
        break;
	case 22:
        $slottype = "Forge Armour[Helm]";
        break;
	case 23:
        $slottype = "Forge Armour[Shield]";
        break;
}

  switch ($crafttype) {
		case 0:
        $crafttype = "Weapon";
        break;
		
		case 1:
        $crafttype = "Armor";
        break;
		
		case 2:
        $crafttype = "Accessory";
        break;
		
		case 3:
        $crafttype = "Potion";
        break;
		
		case 4:
        $crafttype = "Cooking";
        break;
		
		case 10:
        $crafttype = "Gem?";
        break;
		
}

// set needed exp and skill

$needexp = $crafttype . "(" . $needexp . ")";

               
		buildncraftrow($iname,$ipic,$slottype,$needexp,$maxab,$metal,$wood,$leather,$bone,$cloth,$plant,$meat,$powder,$spice,$gem);
     // recursive call 
     getdata($q);

	}
//else do nothing

}



// footers
//guildfooter();
mfooter($mess,$intuser,$database_server['hostname']);


?>


