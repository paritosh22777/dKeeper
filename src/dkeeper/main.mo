// base -> library, List -> module
import List "mo:base/List";
// import Debug "mo:base/Debug";

actor Dkeeper {
  // Note with title and content
  public type Note = {
    title : Text;
    content : Text;
  };

  // Array of notes
  // Empty list
  stable var notes : List.List<Note> = List.nil<Note>();

  // create note and get title and content from JS
  public func createNote(titleText : Text, contentText : Text) {
    let newNote : Note = {
      title = titleText;
      content = contentText;
    };
    // newNote is added at the beginning of notes list
    // notes list is updated everytime new note is pushed
    notes := List.push(newNote, notes);

    // Debug.print(debug_show (notes));
    // o/p-> canister id ? content = ""; title = ""
  };

  public query func readNotes() : async [Note] {
    // return list as array of notes
    return List.toArray(notes);
  };

  public func removeNote(id : Nat) {
    let listFront = List.take(notes, id);
    let listBack = List.drop(notes, id + 1);
    notes := List.append(listFront, listBack);
  };
};
