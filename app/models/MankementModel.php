<?php
class MankementModel
{
  private $db;

  public function __construct()
  {
    $this->db = new Database();
  }

  public function getMankements()
  {
    $this->db->query("SELECT Mankement.Datum
                            ,Mankement.Id
                            ,Mankement.Mankement
                            ,Instructeur.Naam
                            ,Instructeur.Id
                            ,Instructeur.Email
                            ,Auto.Kenteken
                            ,Auto.Id
                             FROM Instructeur
                             INNER JOIN auto
                             ON auto.InstructeurId = Instructeur.Id
                             INNER JOIN Mankement
                             ON Mankement.AutoId = auto.Id
                             WHERE Instructeur.Id = :Id");
    $this->db->bind(':Id', 2, PDO::PARAM_INT);

    $result = $this->db->resultSet();

    return $result;
  }

  public function addMankement($Mankement, $AutoId, $Datum)
  {
    $this->db->query("INSERT INTO Mankement (Mankement, AutoId, Datum) VALUES (:Mankement, :AutoId, :Datum)");
    $this->db->bind(':Mankement', $Mankement);
    $this->db->bind(':AutoId', $AutoId, PDO::PARAM_INT);
    $this->db->bind(':Datum', $Datum);
    return $this->db->execute();
  }
}
