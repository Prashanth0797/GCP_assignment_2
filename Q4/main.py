import base64
import json
import os


from google.cloud import storage
from google.cloud import vision

vision_client = vision.ImageAnnotatorClient()
storage_client = storage.Client()



def detect_objects(file, context):
    bucket = file['bucket']
    filename = file['name']
    print('Looking for objects in image {}'.format(filename))
    try:
        objects = vision_client.object_localization({
            'source': {'image_uri': 'gs://{}/{}'.format(bucket, filename)}
        }).localized_object_annotations
        print('Number of objects found: {}'.format(len(objects)))
        for object_ in objects:
            print('\n{} (confidence: {})'.format(object_.name, object_.score))
    except:
        print("Error")
