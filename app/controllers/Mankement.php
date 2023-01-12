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



  public function addMankement($id = NULL)
  {
    if ($_SERVER['REQUEST_METHOD'] == "POST") {

      $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

      $result = $this->MankementModel->addMankement($_POST);

      if ($result) {
        echo "<h3>de data is opgeslagen</h3>";
        header('Refresh:3; url=' . URLROOT . '/Mankement/index');
      } else {
        echo "<h3>de data is niet opgeslagen</h3>";
        header('Refresh:3; url=' . URLROOT . '/Mankement/index');
      }
    } else {

      $data = [
        'title' => 'Onderwerp Toevoegen',
        'id' => $id
      ];

      $this->view('Mankement/addMankement', $data);
    }
  }
}
