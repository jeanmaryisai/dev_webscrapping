from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Note
from .serializers import NoteSerializer
from rest_framework import status
# Create your views here.

@api_view(['Get'])
def getRoutes(request):
    return Response({'routes':"hello world"})  


@api_view(['Get','Post'])
def getNotes(request):
    if request.method == 'POST':
        data = request.data
        serializer = NoteSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    notes = Note.objects.all()
    serializer = NoteSerializer(notes, many=True)
    return Response(serializer.data)


@api_view(['Get','Delete','Put'])
def getNote(request, note_id):
    note = Note.objects.get(pk=note_id)
    serializer = NoteSerializer(note,many=False)    
    if request.method == 'DELETE':
        note.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    if request.method == 'PUT':
        data = request.data
        serializer = NoteSerializer(note, data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    return Response(serializer.data)