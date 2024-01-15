import UIKit
import DropDown

class ViewController: UIViewController {


    @IBOutlet weak var dropDownBtn: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = dropDownBtn
        dropDown.dataSource = dropDownData
        searchTextField.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
    }

    
    @objc func searchTextChanged(){
        if let searchText = searchTextField.text, !searchText.isEmpty {
            let filteredData = dropDownData.filter { $0.lowercased().contains(searchText.lowercased())}
            dropDown.dataSource = filteredData.isEmpty ? ["Search result not found"] : filteredData
            dropDown.show()
        } else {
            
            dropDown.dataSource = dropDownData
            dropDown.hide()
        }
    }
    

    @IBAction func dropDownBtnTapped(_ sender: UIButton) {
        dropDown.show()
        dropDown.selectionAction = { [weak self ] (index: Int, item: String) in
            print("Selected item: \(item)")
        }
    }
}

