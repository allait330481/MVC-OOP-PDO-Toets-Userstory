<?php
class Mankement extends Controller
{
  private $MankementModel;

  public function __construct()
  {
    $this->MankementModel = $this->model('MankementModel');
  }

  public function index()
  {
    $result = $this->MankementModel->getMankements();
    $rows = "";

    foreach ($result as $Mankementinfo) {
      $rows .= "<tr>
                 <td>{$Mankementinfo->Datum}</td>
                 <td>{$Mankementinfo->Mankement}</td>
                </tr>";
    }
    $data = [
      'title' => "Overzicht Mankement",
      'rows' => $rows,
      'instructorName' => $result[0]->Naam,
      'Email' => $result[0]->Email,
      'Kenteken' => $result[0]->Kenteken
    ];
    $this->view('Mankement/index', $data);
  }

  public function add()
  {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      $Mankement = $_POST['Mankement'];
      $AutoId = $_POST['AutoId'];
      $Datum = date("Y-m-d H:i:s");
      if ($this->MankementModel->addMankement($Mankement, $AutoId, $Datum)) {
        header('Location: ' . URLROOT . '/Mankement');
        exit();
      } else {
        die('Something went wrong');
      }
    } else {
      $Mankement = "";
      $this->view('Mankement/add', $Mankement);
    }
  }
}
