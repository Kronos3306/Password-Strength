//
//  ViewController.swift
//  Password Strength
//
//  Created by Gleb Bair on 11/22/22.
//

import Cocoa

class ViewController: NSViewController {
    // MARK: Outlet module initializations
    @IBOutlet weak var mainTable: NSTableView!
    
    
    // MARK: Variables
    var suggested: [PasswordSuggestStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load a default set of suggested passwords
        for i in 1...12 {
            let suggestion = PasswordSuggestStruct(index: i, suggestedPassword: ProfileDefaults.init().generatePasswordSet())
            
            suggested.append(suggestion)
        }
    }
    
    // MARK: Button events
    @IBAction func btnExitProgram(_ sender: Any?) {
        self.dismiss(ViewController.self)
    }
}

// MARK: Extensions
extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return suggested.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let content = suggested[row]
        
        // The cell where data will be supplied
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        
        if (tableColumn?.identifier)!.rawValue == "tableViewIndex" {
            cell.textField?.stringValue = String(content.index ?? 0)
        } else if (tableColumn?.identifier)!.rawValue == "passSuggestions" {
            cell.textField?.stringValue = content.suggestedPassword ?? "Null"
        }
        
        return cell
    }
}
