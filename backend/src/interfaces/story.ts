import { model, Schema,Document,Types } from "mongoose"

export class Story extends Document{
    id: string;
    name: string;
    description?: string;
    thumbnailUrl: string;
    audioUrl: string;
    audioLength: number;
    publisherId: string;
    likes: string[];
    tags: string[];

    constructor({
        id,
        name,
        description,
        thumbnailUrl,
        audioUrl,
        audioLength,
        publisherId,
        likes = [],
        tags = []
    }: {
        id?: string;
        name: string;
        description?: string;
        thumbnailUrl: string;
        audioUrl: string;
        audioLength: number;
        publisherId: string;
        likes?: string[];
        tags?: string[];
    }) {
        super();
        this.id = id ?? new Types.ObjectId().toHexString();
        this.name = name;
        this.description = description;
        this.thumbnailUrl = thumbnailUrl;
        this.audioUrl = audioUrl;
        this.audioLength = audioLength;
        this.publisherId = publisherId;
        this.likes = likes;
        this.tags = tags;
    }

    copyWith({
        id,
        name,
        description,
        thumbnailUrl,
        audioUrl,
        audioLength,
        publisherId,
        likes,
        tags
    }: Partial<Story>): Story {
        return new Story({
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
            audioUrl: audioUrl ?? this.audioUrl,
            audioLength: audioLength ?? this.audioLength,
            publisherId: publisherId ?? this.publisherId,
            likes: likes ?? this.likes,
            tags: tags ?? this.tags
        });
    }

    toMap(): Record<string, any> {
        return {
            id: this.id,
            name: this.name,
            description: this.description,
            thumbnailUrl: this.thumbnailUrl,
            audioUrl: this.audioUrl,
            audioLength: this.audioLength,
            publisherId: this.publisherId,
            likes: this.likes,
            tags: this.tags
        };
    }

    static fromMap(map: Record<string, any>): Story {
        return new Story({
            id: map.id,
            name: map.name,
            description: map.description,
            thumbnailUrl: map.thumbnailUrl,
            audioUrl: map.audioUrl,
            audioLength: map.audioLength,
            publisherId: map.publisherId,
            likes: map.likes,
            tags: map.tags
        });
    }

    toJson(): string {
        return JSON.stringify(this.toMap());
    }

    static fromJson(json: string): Story {
        return Story.fromMap(JSON.parse(json));
    }

    toString(): string {
        return `Story(id: ${this.id}, name: ${this.name}, description: ${this.description}, thumbnailUrl: ${this.thumbnailUrl}, audioUrl: ${this.audioUrl}, audioLength: ${this.audioLength}, publisherId: ${this.publisherId}, likes: ${this.likes}, tags: ${this.tags})`;
    }

    equals(other: Story): boolean {
        return this.id === other.id &&
            this.name === other.name &&
            this.description === other.description &&
            this.thumbnailUrl === other.thumbnailUrl &&
            this.audioUrl === other.audioUrl &&
            this.audioLength === other.audioLength &&
            this.publisherId === other.publisherId &&
            JSON.stringify(this.likes) === JSON.stringify(other.likes) &&
            JSON.stringify(this.tags) === JSON.stringify(other.tags);
    }

   
}

export const StorySchema = new Schema<Story>({
    id: { type: String, required: true, unique: true },
    name: { type: String, required: true },
    description: { type: String, required: false },
    thumbnailUrl: { type: String, required: true },
    audioUrl: { type: String, required: true },
    audioLength: { type: Number, required: true },
    publisherId: { type: String, required: true },
    likes: [{ type: String }],
    tags: [{ type: String }]
});

export const StoryModel = model<Story>('Story', StorySchema);
