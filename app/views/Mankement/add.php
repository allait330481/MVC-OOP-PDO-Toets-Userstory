<link rel="stylesheet" href="public/css/style.css">
<h1>Add Mankement</h1>
<br>
<form action="<?php echo URLROOT; ?>/Mankement/add" method="post">
    <label for="Mankement">Mankement:</label>
    <input type="text" name="Mankement" value="<?php echo isset($Mankement) ? $Mankement : ''; ?>">
    <br>
    <br>
    <label for="AutoId">AutoId:</label>
    <select name="AutoId">
        <?php
        foreach ($AutoIds as $AutoId) {
            echo "<option value='" . $AutoId->Id . "'>" . $AutoId->Id . "</option>";
        }
        ?>
    </select>
    <br>
    <br>
    <label for="Datum">Datum:</label>
    <input type="date" name="Datum" value="<?php echo date("Y-m-d"); ?>">
    <br>
    <br>
    <input type="submit" value="Add Mankement">
</form>