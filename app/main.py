from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

class Note(BaseModel):
    id: int
    title: str
    content: str

notes: List[Note] = []

@app.get("/")
def health_check():
    return {"status": "ok"}

@app.post("/notes", response_model=Note)
def create_note(note: Note):
    notes.append(note)
    return note

@app.get("/notes", response_model=List[Note])
def get_notes():
    return notes